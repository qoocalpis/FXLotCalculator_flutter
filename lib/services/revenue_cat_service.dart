import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatService {
  /// private constructor
  RevenueCatService._();

  /// the one and only instance of this singleton
  static final instance = RevenueCatService._();
  bool isPurchased = false;
  late Offerings offerings;
  late Offering offering;

  Future<void> initInAppPurchase() async {
    const iosKey = "appl_LCjrwQcWUMmKqjqvtvFPUzEbhpf";
    const androidKey = "goog_oKQsEOIJdGnMwLrtAOMQqkghyXF";
    const offeringIdentifier = "com.all_currency_pair.app";

    final isar = IsarService.instance;
    final uid = await isar.fetchUid();

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
      offering = offerings.getOffering(offeringIdentifier)!;

      if (uid == AppConst.strEmpty) return;
      final result = await Purchases.logIn(uid);

      await getPurchaserInfo(result.customerInfo);

      // 今アクティブになっているアイテムは以下のように取得可能
      print("アクティブなアイテム ${result.customerInfo.entitlements.active.keys}");

      // await makePurchase();
    } catch (e) {
      print("initInAppPurchase error caught! ${e.toString()}");
    }
  }

  Future<void> getPurchaserInfo(CustomerInfo customerInfo) async {
    const entitlement = "all_courses";
    try {
      isPurchased = await updatePurchases(
        customerInfo,
        entitlement,
      );
      print(isPurchased); //monthly_subscriptionは、適宜ご自身のentitlement名に変えてください
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
