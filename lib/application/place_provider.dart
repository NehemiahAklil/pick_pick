import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pick_pick/domain/place.dart';
import 'package:pick_pick/infrastructure/places_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'place_provider.g.dart';

@riverpod
class SearchForTownToggler extends _$SearchForTownToggler {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class TownSearch extends _$TownSearch {
  @override
  String build() {
    return '';
  }
}

@riverpod
Future<List<Place>> places(PlacesRef ref) async {
  final placesService = ref.watch(placesServiceProvider);

  // return placesService.fetchPlaces();
  return placesService.fetchTestPlaces();
}

@riverpod
Future<List<Place>> filteredPlace(FilteredPlaceRef ref) async {
  final townSearch = ref.watch(townSearchProvider) as String;
  final placesAsyncValue = ref.watch(placesProvider);
  Set<String> uniqueCities = {};
  // if (townSearch.isEmpty){
  List<Place> filteredPlaces = [];
  placesAsyncValue.whenData((places) {
    // Sort the list using city alphabetically
    places.sort((a, b) {
      if (a.city == null && b.city == null) {
        return 0; // Both names are null, consider them equal
      } else if (a.city == null) {
        return -1; // 'a.name' is null, place 'a' before 'b'
      } else if (b.city == null) {
        return 1; // 'b.name' is null, place 'b' before 'a'
      }
      return a.city!
          .compareTo(b.city!); // Both names are not null, compare them
    });

    print(places);
    filteredPlaces = places.where((place) {
      if (!uniqueCities.contains(place.city)) {
        uniqueCities.add("${place.city}");
        print(place.city);
        return true;
      }
      return false;
    }).toList();
  });
  // }
  // return places.whenData((List<Place> value) {
  //   value.sort((a, b) => a.city?.compareTo(b.city));
  //   return value;
  // });
  return filteredPlaces;
}

@riverpod
PlaceService placesService(PlacesServiceRef ref) => PlaceService();
