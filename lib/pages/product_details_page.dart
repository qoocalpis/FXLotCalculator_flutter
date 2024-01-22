import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:lot_size_calculator_app/pages/widgets/alert_dialog_input_text.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class Paywall extends StatefulWidget {
  const Paywall({super.key});

  @override
  State<Paywall> createState() => _PaywallState();
}

class _PaywallState extends State<Paywall> {
  late Offering offering;
  @override
  void initState() {
    super.initState();
    final revenueCatService = RevenueCatService.instance;
    offering = revenueCatService.offering;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final package = offering.availablePackages.first;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.3,
              color: Colors.amberAccent,
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: const Text(
                "全通貨ペア & 破産確率機能追加!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: const Text(
                "28通貨ペアの使用制限の開放,格リスクリワードと詳細な資金率による破産確率計算の機能追加",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              height: screenHeight * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 71, 197, 90),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '購入',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialogInputText(isCreateUser: true);
                    },
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialogInputText(isCreateUser: false);
                  },
                );
              },
              child: const Text(
                "Restore Purchase items and conditions",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
