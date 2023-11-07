import 'package:lot_size_calculator_app/models/currency_pair_model.dart';
import 'package:lot_size_calculator_app/services/google_sheet_services.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'currency_pair_controller.g.dart';

@Riverpod(keepAlive: true)
class CurrencyPairModelNotifier extends _$CurrencyPairModelNotifier {
  final googleSheetService = GoogleSheetService.instance;
  final isarService = IsarService.instance;

  @override
  Future<List<CurrencyPairModel>?> build() async {
    final list = googleSheetService.list;
    final user = await isarService.fecthDatabase();

    if (list.isEmpty) return null;
  }
}
