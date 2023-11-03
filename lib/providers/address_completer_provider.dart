import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'address_completer_provider.g.dart';
const apiKeyDev = "AIzaSyB5o9uiM7P5fDa9k0cCxfinoRPzzgJDk_U";

@riverpod
Future<List<AutocompletePrediction>> addressAutocomplete(
    AddressAutocompleteRef ref, String query) async {
  if (query.isEmpty) {
    return [];
  }

  final url =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&key=$apiKeyDev&types=address';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return List<AutocompletePrediction>.from(result["predictions"].map(
        (place) => AutocompletePrediction(
            description: place["description"], placeId: place["place_id"])));
  } else {
    throw Exception('Failed to load suggestions');
  }
}


class AutocompletePrediction {
  final String description;
  final String placeId;

  AutocompletePrediction({required this.description, required this.placeId});
}

final placeDetailsProvider =
    FutureProvider.family<LatLng, String>((ref, placeId) async {
  final url =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKeyDev';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    final location = result["result"]["geometry"]["location"];
    return LatLng(location["lat"], location["lng"]);
  } else {
    throw Exception('Failed to load place details');
  }
});
