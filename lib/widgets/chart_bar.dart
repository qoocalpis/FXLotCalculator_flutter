import 'package:d_chart/commons/axis.dart';
import 'package:d_chart/commons/config_render.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/commons/decorator.dart';
import 'package:d_chart/commons/style.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/component/colors.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_pips_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChartBar extends ConsumerWidget {
  const ChartBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riskRewardPipsGroupList = [
      OrdinalGroup(
        id: '0',
        data: [
          OrdinalData(
              domain: AppLocalizations.of(context)!.risk,
              measure: ref.watch(riskPipsNotifierProvider)),
          OrdinalData(
              domain: AppLocalizations.of(context)!.reward,
              measure: ref.watch(rewardPipsNotifierProvider)),
        ],
      )
    ];
    return Container(
      color: AppColor.chartBarBgColor,
      child: DChartBarO(
        animate: true,
        animationDuration: const Duration(milliseconds: 600),
        barLabelDecorator: BarLabelDecorator(),
        insideBarLabelStyle: (group, ordinalData, index) {
          return const LabelStyle(
            color: Colors.black,
          );
        },
        barLabelValue: (group, ordinalData, index) =>
            '${ordinalData.measure} pips',
        domainAxis: const DomainAxis(
          lineStyle: LineStyle(color: Colors.black),
          labelStyle: LabelStyle(color: Colors.black),
        ),
        configRenderBar: ConfigRenderBar(radius: 12),
        measureAxis: const MeasureAxis(
            thickLength: 3,
            showLine: true,
            lineStyle: LineStyle(
              color: Colors.black,
            )),
        groupList: riskRewardPipsGroupList,
        fillColor: (group, ordinalData, index) {
          if (ordinalData.domain == AppLocalizations.of(context)!.reward) {
            return AppColor.takeProfitBgColor;
          }
          return AppColor.lossCutBgColor;
        },
        vertical: false,
      ),
    );
  }
}
