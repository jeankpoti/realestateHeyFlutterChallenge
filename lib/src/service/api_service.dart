import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:realstate/src/features/item/models/property.dart';

import '../constants/api_key.dart';

class ApiService {
  Future<List<Property>> getProperties(double query) async {
    final response = await http.get(
      Uri.https(
        'bayut.p.rapidapi.com',
        '/properties/list',
        {
          'locationExternalIDs': '5002,6020',
          'purpose': 'for-rent',
          'hitsPerPage': '25',
          'page': '0',
          'lang': 'en',
          'sort': 'city-level-score',
          'rentFrequency': 'monthly',
          'categoryExternalID': '4',
          'priceMin': '$query',
        },
      ),
      headers: {
        'X-RapidAPI-Key': ApiKey.apiKey,
        'X-RapidAPI-Host': 'bayut.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final List<Property> properties = [];
      final Map<String, dynamic> json = jsonDecode(response.body);

      final List<dynamic> propertiesJson = json['hits'];
      for (var element in propertiesJson) {
        final property = Property.fromJson(element);
        properties.add(property);
      }

      return properties;
    } else {
      throw Exception('Failed to load properties');
    }
  }

  Future<List<Property>> getPropertyDetails(String externalID) async {
    final response = await http.get(
      Uri.https(
        'bayut.p.rapidapi.com',
        '/properties/detail',
        {
          'externalID': externalID,
        },
      ),
      headers: {
        'X-RapidAPI-Key': ApiKey.apiKey,
        'X-RapidAPI-Host': 'bayut.p.rapidapi.com',
      },
    );

    print('Failed ');

    if (response.statusCode == 200) {
      final List<Property> propertyDetails = [];
      final Map<String, dynamic> json = jsonDecode(response.body);

      final property = Property.fromJson(json);
      propertyDetails.add(property);

      print('json $json');

      // final List<dynamic> propertiesJson = json['hits'];
      // for (var element in propertiesJson) {
      //   final property = Property.fromJson(element);
      //   properties.add(property);
      // }

      return propertyDetails;
    } else {
      throw Exception('Failed to load properties');
    }
  }
}
