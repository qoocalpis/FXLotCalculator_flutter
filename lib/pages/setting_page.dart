import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/widgets/setting_cell.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';

class SettingPage extends ConsumerWidget {
  SettingPage({super.key, required this.isarService});

  final IsarService isarService;

  List<Text> numbers = List<Text>.generate(
    100,
    (index) => Text(
      '${index + 1}',
      style: const TextStyle(fontSize: 30),
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 56, 74, 82),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 56, 74, 82),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.first_page,
            size: 35,
            color: Colors.blue,
          ),
        ),
        title: Text(AppLocalizations.of(context)!.settingPageTitle),
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
            items: numbers,
          ),
          const SettingCell(
            title: '通貨ペア一覧',
            text: '通貨ペア一覧',
            icon: Icon(Icons.expand_more_outlined),
            onClickedType: OnClickedType.navigator,
          ),
        ],
      ),
    );
  }
}
