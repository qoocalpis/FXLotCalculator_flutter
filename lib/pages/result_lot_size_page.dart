import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/models/lot_size_calculator_model.dart';
import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/provider/currency_pair_controller.dart';
import 'package:lot_size_calculator_app/provider/lot_size_calculator_controller.dart';
import 'package:lot_size_calculator_app/provider/user_controller.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResultLotSizePage extends ConsumerWidget {
  const ResultLotSizePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LotSizeCalculatorModel lotSizeModel =
        ref.watch(lotSizeCalculatorModelNotifierProvider);
    final UserModel? userModelProvider =
        ref.watch(userModelNotifierProvider).when(
              loading: () => null,
              error: (e, s) => null,
              data: (d) => d,
            );
    final String selectedCurrencyPair = ref
        .watch(currencyPairModelNotifierProvider)
        .when(
          loading: () => AppConst.strEmpty,
          error: (e, s) => AppConst.strEmpty,
          data: (d) =>
              d.firstWhere((element) => element.selected == true).currencyPair,
        );
    final String selectedCurrencyPairRate = ref
        .watch(currencyPairModelNotifierProvider)
        .when(
          loading: () => AppConst.loadingText,
          error: (e, s) => AppConst.errorText,
          data: (d) => d.firstWhere((element) => element.selected == true).rate,
        );
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                color: Color.fromARGB(255, 64, 128, 255),
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.appropriateLot,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "${lotSizeModel.lotSize} Lots",
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                buildRow(
                    "${AppLocalizations.of(context)!.accountBalance}  (${userModelProvider?.user.accountCurrency})",
                    '${lotSizeModel.accountBalance} ${userModelProvider?.user.accountCurrency}'),
                buildRow(
                    "${AppLocalizations.of(context)!.lossAllowance} (${userModelProvider?.user.accountCurrency})",
                    "${lotSizeModel.lossAllowableAmount} ${userModelProvider?.user.accountCurrency}"),
                buildRow("${AppLocalizations.of(context)!.lossAllowance} (%)",
                    "${lotSizeModel.percent}%"),
                buildRow(AppLocalizations.of(context)!.stopLoss,
                    "${lotSizeModel.pips}pips"),
                buildRow(AppLocalizations.of(context)!.currencyPair,
                    selectedCurrencyPair),
                buildRow(AppLocalizations.of(context)!.rate,
                    selectedCurrencyPairRate),
                buildRow("1 Lot", "${userModelProvider!.user.lot}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.all(
        12.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
