import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants.dart';
import '../domain/country.dart';
import '../domain/place.dart';
import '../domain/shipping_info.dart';

part 'pickup_state.g.dart';

@riverpod
class PickUpFormToggler extends _$PickUpFormToggler {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class PickUpInfo extends _$PickUpInfo {
  @override
  ShippingInformation build() {
    return ShippingInformation(location: Place(), country: countries.first);
  }

  Future<void> setCountry(Country pickUpCountry) async {
    state =
        ShippingInformation(location: state.location, country: pickUpCountry);
  }

  Future<void> setLocation(Place pickUpCountry) async {
    state =
        ShippingInformation(location: pickUpCountry, country: state.country);
  }
}
