import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

const apiKeyDev = "AIzaSyB5o9uiM7P5fDa9k0cCxfinoRPzzgJDk_U";

final addressAutocompleteProvider =
    FutureProvider.family<List<AutocompletePrediction>, String>(
        (ref, input) async {
  if (input.isEmpty) {
    return [];
  }

  final url =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKeyDev&types=address';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final result = json.decode(response.body);
    return List<AutocompletePrediction>.from(result["predictions"].map(
        (place) => AutocompletePrediction(
            description: place["description"], placeId: place["place_id"])));
  } else {
    throw Exception('Failed to load suggestions');
  }
});

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
