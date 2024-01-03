import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> initPlatformState() async {
  const iosKey = "appl_LCjrwQcWUMmKqjqvtvFPUzEbhpf";
  await Purchases.setLogLevel(LogLevel.debug);

  PurchasesConfiguration? configuration;
  if (Platform.isAndroid) {
    configuration = PurchasesConfiguration("goog_oKQsEOIJdGnMwLrtAOMQqkghyXF");
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
  try {
    Offerings offerings = await Purchases.getOfferings();
    if (offerings.current != null) {
      print("offerings.current");
      // Display current offering with offerings.current
    }
  } on PlatformException catch (e) {
    print(e);
    print("エラーーーーーーーーーーーーーーーーーーーー");

    // optional error handling
  }
}
