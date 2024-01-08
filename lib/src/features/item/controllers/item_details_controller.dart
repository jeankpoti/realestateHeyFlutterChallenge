import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realstate/src/features/item/models/property.dart';

import '../../../service/api_service.dart';

final itemDetailsControllerProvider =
    StateNotifierProvider<ItemDetailsController, List<Property>>((ref) {
  return ItemDetailsController();
});

class ItemDetailsController extends StateNotifier<List<Property>> {
  ItemDetailsController() : super([]);

  ApiService apiService = ApiService();

  Future<void> getPropertyDetails(String externalId) async {
    try {
      final data = await apiService.getPropertyDetails(externalId);

      state = data;
    } on Exception catch (err) {
      print('Error getting items $err');
    }
  }
}
