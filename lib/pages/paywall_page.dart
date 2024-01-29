import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/widgets/authorization_user.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PaywallPage extends ConsumerStatefulWidget {
  const PaywallPage({super.key});

  @override
  ConsumerState<PaywallPage> createState() => _PaywallPageState();
}

class _PaywallPageState extends ConsumerState<PaywallPage> {
  final revenueCatService = RevenueCatService.instance;
  late Offering offering;
  @override
  void initState() {
    super.initState();
    offering = revenueCatService.offering;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
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
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
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
                  onPressed: () async {
                    final c1 = userModelProvider!.user.uid != AppConst.strEmpty;
                    final c2 = userModelProvider.user.userAuthType !=
                        AppConst.strEmpty;
                    if (c1 && c2) {
                      //購入処理
                      await revenueCatService
                          .makePurchase(userModelProvider.user.uid)
                          .then((_) {
                        ref
                            .read(inAppPurchaseNotifierProvider.notifier)
                            .setProperty(revenueCatService.isPurchased);
                        Navigator.pop(context);
                      });
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('ユーザー認証が必要です'),
                            content: const Text("ユーザー認証を行いますか？"),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                  child: const Text('OK'),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    final createdUser = await showDialog<bool>(
                                      context: context,
                                      builder: (context) {
                                        return const AuthorizationUser();
                                      },
                                    );
                                    if (createdUser != null && createdUser) {
                                      await revenueCatService
                                          .makePurchase(
                                              userModelProvider.user.uid)
                                          .then((_) {
                                        ref
                                            .read(inAppPurchaseNotifierProvider
                                                .notifier)
                                            .setProperty(
                                                revenueCatService.isPurchased);
                                        Navigator.pop(context);
                                      });
                                    }
                                  }),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
