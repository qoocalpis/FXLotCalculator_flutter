import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/pages/currency_pair_list_page.dart';
import 'package:lot_size_calculator_app/pages/test.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';
import 'package:lot_size_calculator_app/utils/sizes.dart';

enum OnClickedType {
  picker,
  navigator,
}

class SettingCell extends ConsumerWidget {
  const SettingCell({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
    this.onClickedType = OnClickedType.picker,
    this.items,
  });

  final String title;
  final String text;
  final Icon icon;
  final OnClickedType onClickedType;
  final List<String>? items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModelProvider = ref.watch(userModelNotifierProvider).when(
          loading: () => '',
          error: (e, s) => '',
          data: (d) {
            switch (items) {
              case SettingConst.accountCurrencys:
                return d.user.accountCurrency;
              case SettingConst.constractSizes:
                return d.user.lot.toString();
              case SettingConst.percentList:
                return d.user.percent.toString();
            }
          },
        );
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              fixedSize: Size.fromHeight(SizeConfig.screenHeight * 0.09),
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
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
                icon
              ],
            ),
            onPressed: () {
              if (onClickedType == OnClickedType.picker) {
                BottomPicker(
                  items: List<Text>.generate(
                    items!.length,
                    (index) => Text(
                      items![index],
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  selectedItemIndex: items!.indexOf(userModelProvider!),
                  title: title,
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  displaySubmitButton: false,
                  onChange: (index) {
                    final notifier =
                        ref.read(userModelNotifierProvider.notifier);
                    notifier.onChangePropertyToIsar(index, items!);
                  },
                ).show(context);
              }
              if (onClickedType == OnClickedType.navigator) {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return CurrencyPairListPage();
                      // return SampleListView();
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
