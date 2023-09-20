import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lot_size_calculator_app/component/colors.dart';

class LotSizeCalculatorPage extends StatefulWidget {
  const LotSizeCalculatorPage({super.key});

  @override
  State<LotSizeCalculatorPage> createState() => _LotSizeCalculatorPageState();
}

class _LotSizeCalculatorPageState extends State<LotSizeCalculatorPage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.lotSizeCalculatorPageBgColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(),
            _listBills(),
          ],
        ),
      ),
    );
  }

  _headSection() {
    double h = MediaQuery.of(context).size.height * 0.2;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
        color: Colors.green,
      ),
      height: h,
      child: const Stack(
        children: [],
      ),
    );
  }

  _listBills() {
    double startPosition = MediaQuery.of(context).size.height * 0.22;
    double w = MediaQuery.of(context).size.width;

    return Positioned(
      top: startPosition,
      child: Container(
        height: 100,
        width: w * 0.9,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFd8dbe0),
                offset: Offset(1, 1),
                blurRadius: 20.0,
                spreadRadius: 10,
              )
            ]),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: _cellTitle(AppLocalizations.of(context)!.accountBalance),
              ),
              Container(
                width: 100,
                child: const TextField(
                  textAlign: TextAlign.right,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        //color: Colors.red,
      ),
    );
  }

  _cellTitle(String cellTitle) {
    return Text(
      cellTitle,
      style: const TextStyle(
        color: Color.fromARGB(255, 49, 49, 49),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
