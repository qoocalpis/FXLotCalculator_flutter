import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstLoadingRatePage extends StatefulWidget {
  const FirstLoadingRatePage({Key? key}) : super(key: key);

  @override
  FirstLoadingRatePageState createState() => FirstLoadingRatePageState();
}

class FirstLoadingRatePageState extends State<FirstLoadingRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.FirstLoadingRatePageBgColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Padding(
            padding: EdgeInsets.all(8.0), //全方向に8のパディング
            child: CircularProgressIndicator(
                color: Colors.black, backgroundColor: Colors.green),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), //全方向に8のパディング
            // child: Text('テキスト'),
            child: Text(
              AppLocalizations.of(context)!.loadingRateApi,
            ),
          ),
        ]),
      ),
    );
  }
}
