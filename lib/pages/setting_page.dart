import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/paywall_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/authorization_user.dart';
import 'package:lot_size_calculator_app/pages/widgets/setting_cell.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    final isPurchased = ref.watch(inAppPurchaseNotifierProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 56, 74, 82),
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            AppColor.mainBgColor, //const Color.fromARGB(255, 56, 74, 82),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          icon: const Icon(
            Icons.first_page,
            size: 35,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              size: 30,
              color: Colors.pink,
            ),
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return const AuthorizationUser();
                },
              )
            },
          ),
        ],

        title: Text(
          AppLocalizations.of(context)!.settingPageTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingCell(
              title: AppLocalizations.of(context)!.accountCurrency,
              text: '${userModelProvider?.user.accountCurrency}',
              icon: const Icon(Icons.expand_more_outlined),
              items: SettingConst.accountCurrencys,
            ),
            SettingCell(
              title: AppLocalizations.of(context)!.contractSize,
              text: '${userModelProvider?.user.lot}',
              icon: const Icon(Icons.expand_more_outlined),
              items: SettingConst.constractSizes,
            ),
            SettingCell(
              title: AppLocalizations.of(context)!.fixedProfitAndLossAllowance,
              text: '${userModelProvider?.user.percent} %',
              icon: const Icon(Icons.expand_more_outlined),
              items: SettingConst.percentList,
            ),
            SettingCell(
              title: AppLocalizations.of(context)!.currencyPairListTitle,
              text: AppLocalizations.of(context)!.currencyPairListTitle,
              icon: const Icon(Icons.list_outlined),
              onClickedType: OnClickedType.navigator,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, top: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "", //dummy
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: Size.fromHeight(
                          MediaQuery.of(context).size.height * 0.09),
                      //Sizeクラスで高さを指定
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), //角の丸み
                      ),
                      backgroundColor: Colors.black38,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.currencyPairListTitle,
                          style: const TextStyle(color: Colors.white),
                        ),
                        !isPurchased
                            ? const Text(
                                "Free",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            : const Text(
                                "Pro +",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                      ],
                    ),
                    onPressed: () async {
                      if (!isPurchased) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return const PaywallPage();
                            },
                          ),
                        );
                      }
                    },
                  ),
                  TextButton(
                    child: const Text(
                      "Restore Purchase item and condition >",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      final c1 =
                          userModelProvider!.user.uid != AppConst.strEmpty;
                      final c2 = userModelProvider.user.userAuthType !=
                          AppConst.strEmpty;
                      if (c1 && c2) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                AppLocalizations.of(context)!
                                    .userAuthentication,
                              ),
                              content: const Text("購入情報を復元しますか？"),
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
                                    final revenueCatService =
                                        RevenueCatService.instance;
                                    final result = await Purchases.logIn(
                                        userModelProvider.user.uid);
                                    revenueCatService
                                        .getPurchaserInfo(result.customerInfo)
                                        .then((_) {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: const Text("購入情報を更新しました。"),
                                            actions: [
                                              TextButton(
                                                  child: const Text('OK'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  }),
                                            ],
                                          );
                                        },
                                      );
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AuthorizationUser();
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
