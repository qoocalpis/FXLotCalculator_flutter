import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/create_user_page.dart';
import 'package:lot_size_calculator_app/pages/product_details_page.dart';
import 'package:lot_size_calculator_app/pages/widgets/alert_dialog_input_text.dart';
import 'package:lot_size_calculator_app/pages/widgets/setting_cell.dart';
import 'package:lot_size_calculator_app/provider/in_app_purchase_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/colors.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';

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
        title: Text(
          AppLocalizations.of(context)!.settingPageTitle,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          SettingCell(
            title: 'Account Currency',
            text: '${userModelProvider?.user.accountCurrency}',
            icon: const Icon(Icons.expand_more_outlined),
            items: SettingConst.accountCurrencys,
          ),
          SettingCell(
            title: 'Contract size (Units per Lot)',
            text: '${userModelProvider?.user.lot}',
            icon: const Icon(Icons.expand_more_outlined),
            items: SettingConst.constractSizes,
          ),
          SettingCell(
            title: '固定損益許容額(%)',
            text: '${userModelProvider?.user.percent} %',
            icon: const Icon(Icons.expand_more_outlined),
            items: SettingConst.percentList,
          ),
          const SettingCell(
            title: '通貨ペア一覧',
            text: '通貨ペア一覧',
            icon: Icon(Icons.list_outlined),
            onClickedType: OnClickedType.navigator,
          ),
          Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // const Text(
                //   "", //dummy
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //     color: Colors.white,
                //   ),
                // ),
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
                      const Text(
                        "現在の製品版",
                        style: TextStyle(color: Colors.white),
                      ),
                      !isPurchased
                          ? const Text(
                              "Free",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          : const Text(
                              "Pro+",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                    ],
                  ),
                  onPressed: () async {
                    // if (!isPurchased) {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          //  return const Paywall(offering: null,);
                          return const Paywall();
                        },
                      ),
                    );
                    // }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
