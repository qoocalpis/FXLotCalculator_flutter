import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/pages/widgets/calculation_set_cell.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/main_screen_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';

class LotSizeCalculatorPage extends ConsumerWidget {
  const LotSizeCalculatorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('LotSizeCalculatorPage');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .watch(mainScreenModelNotifierProvider.notifier)
          .setScreenTitle(AppLocalizations.of(context)!.lotSizeCalculatorTitle);
    });
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
                color: Colors.green,
              ),
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Stack(
                children: [],
              ),
            ),
            CalculationSetCell(
              title: AppLocalizations.of(context)!.accountBalance,
              type: UpdatePropertyType.accountBalance,
              subTitle: "(${userModelProvider?.user.accountCurrency})",
            ),
            CalculationSetCell(
              title: AppLocalizations.of(context)!.lossAllowance,
              type: UpdatePropertyType.percent,
            ),
            CalculationSetCell(
              title: AppLocalizations.of(context)!.lossTolerancePips,
              type: UpdatePropertyType.pips,
            ),
          ],
        ),
      ),
    );
  }
}
