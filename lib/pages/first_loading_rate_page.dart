import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstLoadingRatePage extends StatelessWidget {
  const FirstLoadingRatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.firstLoadingRatePageBgColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(8.0), //全方向に8のパディング
            child: CircularProgressIndicator(
                color: Colors.black, backgroundColor: Colors.green),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), //全方向に8のパディング
            child: Text(
              AppLocalizations.of(context)!.loadingRateApi,
            ),
          ),
        ]),
      ),
    );
  }
}
