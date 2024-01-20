import 'package:lot_size_calculator_app/services/revenue_cat_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'in_app_purchase_controller.g.dart';

@Riverpod(keepAlive: true)
class InAppPurchaseNotifier extends _$InAppPurchaseNotifier {
  final revenueCatService = RevenueCatService.instance;

  @override
  bool build() => revenueCatService.isPurchased;

  void setProperty(bool result) {
    state = result;
  }
}
