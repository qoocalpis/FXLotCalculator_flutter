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
            accountBalanceCell(),
            lossPercentCell(),
            lossPipsCell(),
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

  accountBalanceCell() {
    double startPosition = MediaQuery.of(context).size.height * 0.22;
    double w = MediaQuery.of(context).size.width;

    return Positioned(
      top: startPosition,
      child: Container(
        //height: 200,
        width: w * 0.9,
        decoration: _boxDecoration(),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cellTitle(AppLocalizations.of(context)!.accountBalance),
              const Row(
                children: <Widget>[
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("USD"),
                ],
              ),
            ],
          ),
        ),
        //color: Colors.red,
      ),
    );
  }

  lossPercentCell() {
    double startPosition = MediaQuery.of(context).size.height * 0.37;
    double w = MediaQuery.of(context).size.width;

    return Positioned(
      top: startPosition,
      child: Container(
        width: w * 0.9,
        decoration: _boxDecoration(),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cellTitle(AppLocalizations.of(context)!.lossAllowance),
              const Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("USD"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  lossPipsCell() {
    double startPosition = MediaQuery.of(context).size.height * 0.52;
    double w = MediaQuery.of(context).size.width;
    return Positioned(
      top: startPosition,
      child: Container(
        width: w * 0.9,
        decoration: _boxDecoration(),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _cellTitle(AppLocalizations.of(context)!.lossTolerancePips),
              const Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 170,
                    child: TextField(
                      textAlign: TextAlign.right,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Text("Pips"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _cellTitle(String cellTitle) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        cellTitle,
        style: const TextStyle(
          color: Color.fromARGB(255, 49, 49, 49),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  _boxDecoration() {
    return const BoxDecoration(
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
        ),
      ],
    );
  }
}
