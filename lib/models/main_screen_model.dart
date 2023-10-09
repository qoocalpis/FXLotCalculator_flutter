import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_screen_model.freezed.dart';

@freezed
class MainScreenModel with _$MainScreenModel {
  const factory MainScreenModel({
    required String screenTitle,
    required int selectedScreenIndex,
  }) = _MainScreenModel;
}
