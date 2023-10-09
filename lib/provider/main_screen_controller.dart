import 'package:lot_size_calculator_app/models/main_screen_model.dart';
import 'package:lot_size_calculator_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'main_screen_controller.g.dart';

@Riverpod(keepAlive: true)
class MainScreenModelNotifier extends _$MainScreenModelNotifier {
  @override
  MainScreenModel build() => const MainScreenModel(
        screenTitle: AppConst.strEmpty,
        selectedScreenIndex: AppConst.zero,
      );

  void setScreenTitle(String screenTitle) {
    state = state.copyWith(screenTitle: screenTitle);
  }
}
