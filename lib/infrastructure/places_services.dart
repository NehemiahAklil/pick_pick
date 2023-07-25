import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pick_pick/domain/place.dart';

class PlaceService {
  Future<List<Place>> fetchPlaces() async {
    final response = await http
        .get(Uri.parse('http://amircreations.com/walya/get_all_places.php'));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body)['response'];
      return data.map(((e) => Place.fromJSON(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<Place>> fetchTestPlaces() async {
    final String response = await rootBundle.loadString("assets/test.json");
    final List data = jsonDecode(response)['response'];
    return data.map(((e) => Place.fromJSON(e))).toList();
  }
}
