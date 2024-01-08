import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realstate/src/features/item/models/property.dart';

import '../../../service/api_service.dart';

// final itemControllerProvider =
//     StateNotifierProvider.autoDispose<ItemDetailsController, Property>((ref) {
//   return ItemDetailsController();
// });

// class ItemDetailsController extends StateNotifier<Property>{
//   ItemDetailsController() : super(Property);

//   ApiService apiService = ApiService();



//   Future<void> getPropertyDetail(String externalId) async {
//     try {
//       final data = await apiService.getPropertyDetails(externalId);

//       state = data;
//     } on Exception catch (err) {
//       print('Error getting items $err');
//     }
//   }
// }
