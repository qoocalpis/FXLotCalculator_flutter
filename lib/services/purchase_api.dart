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

      //今アクティブになっているアイテムは以下のように取得可能
      // print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");
    } catch (e) {
      print("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> buttonAction() async {
    const offeringIdentifier = "com.all_currency_pair.app";
    try {
      final package = offerings.getOffering(offeringIdentifier)!.lifetime;
      if (package != null) {
        // Display packages for sale
      }
    } on PlatformException catch (e) {
      // optional error handling
    }
  }
}

final inAppPurchaseManager =
    ChangeNotifierProvider((ref) => InAppPurchaseManager());

class InAppPurchaseManager with ChangeNotifier {
  bool isSubscribed = false;
  late Offerings offerings;

  // Future<void> initInAppPurchase() async {

  //   try {
  //     //consoleにdebug情報を出力する
  //     await Purchases.setDebugLogsEnabled(true);
  //     late PurchasesConfiguration configuration;

  //     if (Platform.isAndroid) {
  //       configuration = PurchasesConfiguration(Android用のRevenuecat APIキー);
  //     } else if (Platform.isIOS) {
  //       configuration = PurchasesConfiguration(ios用のRevenuecat APIキー);
  //     }
  //     await Purchases.configure(configuration);
  //     //offeringsを取ってくる
  //     offerings = await Purchases.getOfferings();
  //     //firebaseのidと、revenuecatのuserIdを一緒にしている場合、firebaseAuthのuidでログイン
  //     final result = await Purchases.logIn(auth.currentUser!.uid);

  //     await getPurchaserInfo(result.customerInfo);

  //     //今アクティブになっているアイテムは以下のように取得可能
  //     print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");
  //   } catch (e) {
  //     print("initInAppPurchase error caught! ${e.toString()}");
  //   }

  // }

  // Future<void> getPurchaserInfo(
  //     CustomerInfo customerInfo) async {

  //   try {
  //     isSubscribed = await updatePurchases(customerInfo, monthly_subscription);//monthly_subscriptionは、適宜ご自身のentitlement名に変えてください

  //   } on PlatformException catch (e) {
  //     print(" getPurchaserInfo error ${e.toString()}");
  //   }
  // }

  // Future<bool> updatePurchases(
  //     CustomerInfo purchaserInfo, String entitlement) async {
  //   var isPurchased = false;
  //   final entitlements = purchaserInfo.entitlements.all;
  //   if (entitlements.isEmpty) {
  //     isPurchased = false;
  //   }
  //   if (!entitlements.containsKey(entitlement)) {
  //     ///そもそもentitlementが設定されて無い場合
  //     isPurchased = false;
  //   } else if (entitlements[entitlement]!.isActive) {
  //     ///設定されていて、activeになっている場合
  //     isPurchased = true;
  //   } else {
  //     isPurchased = false;
  //   }
  //   return isPurchased;
  // }
}