// import 'package:flutter/material.dart';
// import 'package:lot_size_calculator_app/services/purchase_api.dart';
// import 'package:purchases_flutter/purchases_flutter.dart';

// enum Entitlement { free, allCourses }

// class RevenueCatProvider extends ChangeNotifier {
//   RevenueCatProvider() {
//     init();
//   }

//   Entitlement _entitlement = Entitlement.free;
//   Entitlement get entitlement => _entitlement;
//   Future init() async {
//     Purchases.addCustomerInfoUpdateListener((customerInfo) async {
//       updatePurchaseStatus();
//     });
//   }

//   Future updatePurchaseStatus() async {
//     final purchaserInfo = await Purchases.getCustomerInfo();
//     final entitlements = purchaserInfo.entitlements.active.values.toList();
//     _entitlement =
//         entitlements.isEmpty ? Entitlement.free : Entitlement.allCourses;
//   }
// }
