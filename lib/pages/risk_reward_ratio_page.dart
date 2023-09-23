import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/decorator.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:ruler_picker_bn/ruler_picker_bn.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:d_chart/d_chart.dart';

class RiskRewardRatioPage extends StatefulWidget {
  const RiskRewardRatioPage({super.key});
  @override
  State<RiskRewardRatioPage> createState() => _RiskRewardRatioPageState();
}

class _RiskRewardRatioPageState extends State<RiskRewardRatioPage> {
  int valueKG = 0;
  int valueCM = 0;

  final ordinalGroup = [
    OrdinalGroup(
      id: '0',
      data: [
        OrdinalData(domain: 'Risk', measure: 100),
        OrdinalData(domain: 'Reward', measure: 200),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          AspectRatio(
            aspectRatio: 11 / 9,
            child: DChartBarO(
              animate: true,
              animationDuration: const Duration(milliseconds: 600),
              barLabelDecorator: BarLabelDecorator(),
              insideBarLabelStyle: (group, ordinalData, index) {
                return const LabelStyle(
                  color: Colors.white,
                );
              },
              barLabelValue: (group, ordinalData, index) =>
                  ordinalData.measure.toString(),
              groupList: ordinalGroup,
              fillColor: (group, ordinalData, index) {
                if (ordinalData.domain == 'Reward') {
                  return const Color.fromARGB(255, 8, 165, 249);
                }
                return const Color.fromARGB(255, 240, 56, 56);
              },
              vertical: false,
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                height: 305,
                child: RulerPicker(
                  onChange: (val) {
                    setState(() {
                      valueKG = val;
                    });
                  },
                  background: Colors.white,
                  lineColor: Colors.black,
                  direction: Axis.vertical,
                  startValue: 70,
                  maxValue: 200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
