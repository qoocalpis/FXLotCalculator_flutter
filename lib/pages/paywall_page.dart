import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/widgets/authorization_user.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final isPurchased = ref.watch(inAppPurchaseNotifierProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SizedBox(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.3,
              color: Colors.amberAccent,
              child: Image.asset('images/ProductImage.png'),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                AppLocalizations.of(context)!.productTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                AppLocalizations.of(context)!.productDetailText,
                textAlign: TextAlign.center,
                style: const TextStyle(
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
                    backgroundColor: isPurchased
                        ? Colors.orange
                        : const Color.fromARGB(255, 71, 197, 90),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      !isPurchased
                          ? Text(
                              AppLocalizations.of(context)!.purchase,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              AppLocalizations.of(context)!.purchased,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                    ],
                  ),
                  onPressed: () async {
                    final c1 = userModelProvider!.user.uid != AppConst.strEmpty;
                    final c2 = userModelProvider.user.userAuthType !=
                        AppConst.strEmpty;
                    if (revenueCatService.isPurchased) return;
                    if (c1 && c2) {
                      //購入処理
                      await revenueCatService
                          .makePurchase(userModelProvider.user.uid);
                      ref
                          .read(inAppPurchaseNotifierProvider.notifier)
                          .setProperty(revenueCatService.isPurchased);
                      if (revenueCatService.isPurchased) {
                        if (!mounted) return;
                        Navigator.pop(context);
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              AppLocalizations.of(context)!
                                  .needUserAuthentication,
                            ),
                            content: Text(
                              AppLocalizations.of(context)!
                                  .askUserAuthentication,
                            ),
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
                                    final _ = await showDialog<bool>(
                                      context: context,
                                      builder: (context) {
                                        return const AuthorizationUser();
                                      },
                                    );
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
