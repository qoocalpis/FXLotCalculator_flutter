import 'package:lot_size_calculator_app/models/user_model.dart';
import 'package:lot_size_calculator_app/services/isar_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_controller.g.dart';

@Riverpod(keepAlive: true)
class UserModelNotifier extends _$UserModelNotifier {
  final isarService = IsarService.instance;
  @override
  Future<UserModel> build() async {
    return await isarService.fecthDatabase();
  }

  void onChangePropertyToIsar(int index, List<String> items) async {
    await isarService.changedData(index, items);
    state = await AsyncValue.guard(
      () async => await isarService.fecthDatabase(),
    );
  }

  void updatePercentProperty(String text) async {
    if (text.isEmpty) {
      return;
    }
    state = const AsyncValue.loading();
    final tmp = await isarService.fecthDatabase();
    tmp.user.percent = int.parse(text);
    state = AsyncData(tmp);
  }

  void updateUserAuthTypeProperty() async {
    state = const AsyncValue.loading();
    final tmp = await isarService.fecthDatabase();
    state = AsyncData(tmp);
  }
}
