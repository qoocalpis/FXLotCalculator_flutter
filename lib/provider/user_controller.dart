import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/services/isar_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserModelNotifier extends _$UserModelNotifier {
  final test = IsarService();
  @override
  Future<UserModel> build() async {
    return await test.fecthDatabase();
  }

  Future<void> onChangeProperty(int index, List<String> items) async {
    await test.changedData(index, items);
    state = await AsyncValue.guard(
      () async => await test.fecthDatabase(),
    );
  }
}