import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realstate/src/features/item/models/property.dart';

import '../../../service/api_service.dart';

final itemControllerProvider =
    StateNotifierProvider.autoDispose<ItemController, List<Property>>((ref) {
  return ItemController();
});

class ItemController extends StateNotifier<List<Property>> {
  ItemController() : super([]);

  ApiService apiService = ApiService();

  Future<void> getProperties(double query) async {
    try {
      final data = await apiService.getProperties(query);
      state = data;
    } on Exception catch (err) {
      print('Error getting items $err');
    }
  }

  Future<void> getPropertyDetail(String externalId) async {
    try {
      final data = await apiService.getPropertyDetails(externalId);

      state = data;
    } on Exception catch (err) {
      print('Error getting items $err');
    }
  }
}
