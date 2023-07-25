// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$placesHash() => r'32a95c23dacde0d6fe1206e73f06827c62ca017b';

/// See also [places].
@ProviderFor(places)
final placesProvider = AutoDisposeFutureProvider<List<Place>>.internal(
  places,
  name: r'placesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$placesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlacesRef = AutoDisposeFutureProviderRef<List<Place>>;
String _$filteredPlaceHash() => r'eb795a2e290fa531f6454f27ec5866d72e73998c';

/// See also [filteredPlace].
@ProviderFor(filteredPlace)
final filteredPlaceProvider = AutoDisposeFutureProvider<List<Place>>.internal(
  filteredPlace,
  name: r'filteredPlaceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredPlaceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilteredPlaceRef = AutoDisposeFutureProviderRef<List<Place>>;
String _$placesServiceHash() => r'95efebb4bc74d6bbac81a49dd0f66287d90529fb';

/// See also [placesService].
@ProviderFor(placesService)
final placesServiceProvider = AutoDisposeProvider<PlaceService>.internal(
  placesService,
  name: r'placesServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$placesServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PlacesServiceRef = AutoDisposeProviderRef<PlaceService>;
String _$searchForTownTogglerHash() =>
    r'7cb4812835e2b20c47b54cf841da0db631019c20';

/// See also [SearchForTownToggler].
@ProviderFor(SearchForTownToggler)
final searchForTownTogglerProvider =
    AutoDisposeNotifierProvider<SearchForTownToggler, bool>.internal(
  SearchForTownToggler.new,
  name: r'searchForTownTogglerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchForTownTogglerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchForTownToggler = AutoDisposeNotifier<bool>;
String _$townSearchHash() => r'aee906e05d4bf7556e1b5702259cd100e8cd79a2';

/// See also [TownSearch].
@ProviderFor(TownSearch)
final townSearchProvider =
    AutoDisposeNotifierProvider<TownSearch, String>.internal(
  TownSearch.new,
  name: r'townSearchProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$townSearchHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TownSearch = AutoDisposeNotifier<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
