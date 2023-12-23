import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';

class LineChartPage extends ConsumerWidget {
  const LineChartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const TextStyle labelStyle =
        TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
    final modelProvider = ref.watch(riskRewardModelNotifierProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8, right: 32),
            height: 350,
            width: double.infinity,
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.grey[200],
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                    axisNameSize: 32,
                    axisNameWidget: Text(
                      "損益率 (${modelProvider.rewardRatio})",
                      style: labelStyle,
                    ),
                  ),
                  rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: false,
                  )),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    axisNameWidget: Container(
                      alignment: Alignment.topCenter,
                      child: const Text(
                        "勝率",
                        style: labelStyle,
                      ),
                    ),
                    axisNameSize: 32,
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    axisNameWidget: const Text(
                      "破産確率",
                      style: labelStyle,
                    ),
                    axisNameSize: 32,
                  ),
                ),
                minX: 1,
                maxX: 100,
                minY: 0,
                maxY: 100,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: false,
                    color: Colors.red[400],
                    barWidth: 4,
                    dotData: FlDotData(show: false),
                    spots: flSpots(modelProvider.continuedLossProbability),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<FlSpot>? flSpots(List<String> list) {
    List<FlSpot> flSpotList = [];
    if (list.isEmpty) {
      return null;
    } else {
      for (var i = 0; i < list.length; i++) {
        if (double.tryParse(list[i]) == null) {
          continue;
        }
        final value = FlSpot(
          double.parse(SettingConst.percentList[i]),
          double.parse(list[i]),
        );
        flSpotList.add(value);
      }
      return flSpotList;
    }
  }
}
