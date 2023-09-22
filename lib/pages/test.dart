import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:d_chart/d_chart.dart';

class RiskRewardRatioPage extends StatefulWidget {
  const RiskRewardRatioPage({super.key});
  @override
  State<RiskRewardRatioPage> createState() => _RiskRewardRatioPageState();
}

class _RiskRewardRatioPageState extends State<RiskRewardRatioPage> {
  late List<RRData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          AspectRatio(
            aspectRatio: 1 / 1,
            child: SfCartesianChart(
              series: <ChartSeries>[
                BarSeries<RRData, String>(
                  dataSource: _chartData,
                  pointColorMapper: (RRData riskReward, _) =>
                      riskReward.rrColor,
                  xValueMapper: (RRData riskReward, _) => riskReward.rrName,
                  yValueMapper: (RRData riskReward, _) => riskReward.rrInt,
                )
              ],
              primaryXAxis: CategoryAxis(),
            ),
          ),
        ],
      ),
    );
  }

  List<RRData> getChartData() {
    final List<RRData> chartData = [
      RRData('Reward', 1000, Color.fromARGB(255, 22, 255, 251)),
      RRData('Risk', 50, Color.fromARGB(255, 255, 43, 43)),
    ];
    return chartData;
  }
}

class RRData {
  RRData(this.rrName, this.rrInt, this.rrColor);
  final String rrName;
  final int rrInt;
  final Color rrColor;
}
