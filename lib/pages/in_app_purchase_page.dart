import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/provider/revenuecat.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class InAppPurChasePage extends StatefulWidget {
  const InAppPurChasePage({super.key});

  @override
  State<InAppPurChasePage> createState() => _InAppPurChasePageState();
}

class _InAppPurChasePageState extends State<InAppPurChasePage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final entitlement = Provider.of<RevenueCatProvider>(context).entitlement;
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("")],
      ),
    );
  }

  Widget buildEntitlement(Entitlement entitlement) {
    switch (entitlement) {
      case Entitlement.allCourses:
        return const Text(
          "You are on Paid plan",
        );
      default:
        return const Text(
          "You are on Free plan",
        );
    }
  }
}
