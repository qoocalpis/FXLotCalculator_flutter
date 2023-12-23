import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lot_size_calculator_app/provider/risk_reward_controller.dart';
import 'package:lot_size_calculator_app/utils/setting_constants.dart';

class ProbabilityTable extends ConsumerWidget {
  const ProbabilityTable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final modelProvider = ref.watch(riskRewardModelNotifierProvider);
    if (!modelProvider.isExist) {
      return const SizedBox();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: 0,
              headingRowColor: MaterialStateProperty.all(
                  const Color.fromARGB(238, 255, 218, 72)),
              columns: const [
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        '損益比率',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        '勝率',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Center(
                      child: Text(
                        '破産確率',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
              rows: [
                for (var i = 0;
                    i < modelProvider.continuedLossProbability.length;
                    i++)
                  DataRow(
                    cells: [
                      DataCell(
                        Center(
                          child: Text(
                            modelProvider.rewardRatio,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            "${SettingConst.percentList[i]} %",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      DataCell(
                        Center(
                          child: Text(
                            "${modelProvider.continuedLossProbability[i]} %",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                    color: MaterialStateProperty.all(
                      i % 2 == 0 ? Colors.grey[100] : Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
