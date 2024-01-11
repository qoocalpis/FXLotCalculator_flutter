import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> initPlatformState() async {
  const iosKey = "appl_LCjrwQcWUMmKqjqvtvFPUzEbhpf";
  const androidKey = "goog_oKQsEOIJdGnMwLrtAOMQqkghyXF";

  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration? configuration;
  if (Platform.isAndroid) {
    configuration = PurchasesConfiguration(androidKey);
  }
  if (Platform.isIOS) {
    configuration = PurchasesConfiguration(iosKey);
  }
  if (configuration != null) {
    await Purchases.configure(configuration);
  }
  await buttonAction();
}

Future<void> buttonAction() async {
  const offeringIdentifier = "com.all_currency_pair.app";
  try {
    Offerings offerings = await Purchases.getOfferings();
    final package = offerings.getOffering(offeringIdentifier)!.lifetime;
    if (package != null) {
      // Display packages for sale
      await buyPackage(package);
    }
  } on PlatformException catch (e) {
    // optional error handling
  }
}

Future<void> buyPackage(Package package) async {
  if (kDebugMode) {
    print("InAppPurchase buyPackage");
  }
  try {
    CustomerInfo customerInfo = await Purchases.purchasePackage(package);
    var isPro =
        customerInfo.entitlements.all["com.all_currency_pair.app"]!.isActive;
    if (isPro) {
      // Unlock that great "pro" content
    }
  } on PlatformException catch (e) {
    var errorCode = PurchasesErrorHelper.getErrorCode(e);
    if (errorCode != PurchasesErrorCode.purchaseCancelledError) {}
  }
}

class PurchaseApi {
  static const _apiKey = "";
  static Future init() async {
    // await Purchases.setDebugLogsEnabled(true);
    // await Purchases.setup(_apiKey);
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null ? [] : [current];
    } on PlatformException catch (e) {
      // optional error handling
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      return false;
    }
  }
}
