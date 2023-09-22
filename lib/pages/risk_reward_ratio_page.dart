import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:d_chart/d_chart.dart';

class RiskRewardRatioPage extends StatefulWidget {
  const RiskRewardRatioPage({super.key});
  @override
  State<RiskRewardRatioPage> createState() => _RiskRewardRatioPageState();
}

class _RiskRewardRatioPageState extends State<RiskRewardRatioPage> {
  final ordinalGroup = [
    OrdinalGroup(
      id: '1',
      data: [
        OrdinalData(domain: 'Risk', measure: 39),
        OrdinalData(domain: 'Reward', measure: 1),
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
            aspectRatio: 19 / 9,
            child: DChartBarO(
              animate: true,
              animationDuration: const Duration(milliseconds: 600),
              barLabelValue: (group, ordinalData, index) {
                return ordinalData.measure.round().toString();
              },
              insideBarLabelStyle: (group, ordinalData, index) {
                return const LabelStyle(
                  color: Colors.white,
                  fontSize: 16,
                );
              },
              fillColor: (group, ordinalData, index) {
                if (ordinalData.measure > 400) {
                  return const Color.fromARGB(255, 8, 165, 249);
                }
                return const Color.fromARGB(255, 240, 56, 56);
              },
              groupList: ordinalGroup,
              vertical: false,
            ),
          ),
        ],
      ),
    );
  }
}
