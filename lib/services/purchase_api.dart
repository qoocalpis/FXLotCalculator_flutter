import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  /// private constructor
  PurchaseApi._();

  /// the one and only instance of this singleton
  static final instance = PurchaseApi._();
  bool isSubscribed = false;
  late Offerings offerings;

  Future<void> initInAppPurchase() async {
    const iosKey = "appl_LCjrwQcWUMmKqjqvtvFPUzEbhpf";
    const androidKey = "goog_oKQsEOIJdGnMwLrtAOMQqkghyXF";

    await Purchases.setLogLevel(LogLevel.debug);

    try {
      late PurchasesConfiguration configuration;
      if (Platform.isAndroid) {
        configuration = PurchasesConfiguration(androidKey);
      }
      if (Platform.isIOS) {
        configuration = PurchasesConfiguration(iosKey);
      }
      await Purchases.configure(configuration);
      //offeringsを取ってくる
      offerings = await Purchases.getOfferings();

      final result = await Purchases.logIn("ni5vuGimHfOHwsCOQC0NyVdmpWq2");

      await getPurchaserInfo(result.customerInfo);

      // 今アクティブになっているアイテムは以下のように取得可能
      print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");

      print(isSubscribed);
      // await makePurchase();
      // print(isSubscribed);
    } catch (e) {
      print("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> getPurchaserInfo(CustomerInfo customerInfo) async {
    const entitlement = "all_courses";
    try {
      isSubscribed = await updatePurchases(
        customerInfo,
        entitlement,
      );
      print(isSubscribed); //monthly_subscriptionは、適宜ご自身のentitlement名に変えてください
    } on PlatformException catch (e) {
      print(" getPurchaserInfo error ${e.toString()}");
    }
  }

  Future<bool> updatePurchases(
      CustomerInfo purchaserInfo, String entitlement) async {
    var isPurchased = false;
    final entitlements = purchaserInfo.entitlements.all;
    if (entitlements.isEmpty) {
      isPurchased = false;
    }
    if (!entitlements.containsKey(entitlement)) {
      ///そもそもentitlementが設定されて無い場合
      isPurchased = false;
    } else if (entitlements[entitlement]!.isActive) {
      ///設定されていて、activeになっている場合
      isPurchased = true;
    } else {
      isPurchased = false;
    }
    return isPurchased;
  }

  Future<void> buttonAction() async {
    try {
      CustomerInfo customerInfo = await Purchases.getCustomerInfo();
      print("アクティブなアイテム ${customerInfo.entitlements.active.keys}");
      // access latest customerInfo
    } on PlatformException catch (e) {
      // Error fetching customer info
    }

    // const offeringIdentifier = "com.all_currency_pair.app";
    // try {
    //   final package = offerings.getOffering(offeringIdentifier)!.lifetime;
    //   if (package != null) {
    //     // Display packages for sale
    //   }
    // } on PlatformException catch (e) {
    //   // optional error handling
    // }
  }

  Future<void> makePurchase() async {
    const offeringIdentifier = "com.all_currency_pair.app";
    try {
      Package? package;
      package = offerings.all[offeringIdentifier]
          ?.lifetime; //offeringsは適宜ご自身の設定したofferingsの名前に変えてください
      if (package != null) {
        print("成功!!!!");

        // await Purchases.logIn(auth.currentUser!.uid);
        CustomerInfo customerInfo = await Purchases.purchasePackage(package);

        await getPurchaserInfo(customerInfo);
      }
    } on PlatformException catch (e) {
      print(" makePurchase error ${e.toString()}");
    }
  }
}

class InAppPurchaseManager {
  bool isSubscribed = false;
  late Offerings offerings;

  Future<void> initInAppPurchase() async {
    const iosKey = "appl_LCjrwQcWUMmKqjqvtvFPUzEbhpf";
    const androidKey = "goog_oKQsEOIJdGnMwLrtAOMQqkghyXF";

    try {
      //consoleにdebug情報を出力する
      await Purchases.setDebugLogsEnabled(true);
      late PurchasesConfiguration configuration;

      if (Platform.isAndroid) {
        configuration = PurchasesConfiguration(androidKey);
      } else if (Platform.isIOS) {
        configuration = PurchasesConfiguration(iosKey);
      }
      await Purchases.configure(configuration);
      //offeringsを取ってくる
      offerings = await Purchases.getOfferings();
      //firebaseのidと、revenuecatのuserIdを一緒にしている場合、firebaseAuthのuidでログイン
      LogInResult result =
          await Purchases.logIn("ni5vuGimHfOHwsCOQC0NyVdmpWq2");

      await getPurchaserInfo(result.customerInfo);

      //今アクティブになっているアイテムは以下のように取得可能
      print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");
    } catch (e) {
      print("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> getPurchaserInfo(CustomerInfo customerInfo) async {
    const entitlement = "com.all_currency_pair.app";

    try {
      isSubscribed = await updatePurchases(
          customerInfo, entitlement); //適宜ご自身のentitlement名に変えてください
    } on PlatformException catch (e) {
      print(" getPurchaserInfo error ${e.toString()}");
    }
  }

  Future<bool> updatePurchases(
      CustomerInfo purchaserInfo, String entitlement) async {
    var isPurchased = false;
    final entitlements = purchaserInfo.entitlements.all;
    if (entitlements.isEmpty) {
      isPurchased = false;
    }
    if (!entitlements.containsKey(entitlement)) {
      ///そもそもentitlementが設定されて無い場合
      isPurchased = false;
    } else if (entitlements[entitlement]!.isActive) {
      ///設定されていて、activeになっている場合
      isPurchased = true;
    } else {
      isPurchased = false;
    }
    return isPurchased;
  }
}
