import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pick_pick/constants.dart';
import 'package:pick_pick/domain/country.dart';
import 'package:pick_pick/domain/shipping_info.dart';
import 'package:pick_pick/domain/place.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drop_state.g.dart';

@riverpod
class DropFormToggler extends _$DropFormToggler {
  @override
  bool build() {
    return false;
  }

  void toggle() {
    state = !state;
  }
}

@riverpod
class DropInfo extends _$DropInfo {
  @override
  ShippingInformation build() {
    return ShippingInformation(location: Place(), country: countries.first);
  }

  Future<void> setCountry(Country dropCountry) async {
    state = ShippingInformation(location: state.location, country: dropCountry);
  }

  Future<void> setLocation(Place pickUpCountry) async {
    state =
        ShippingInformation(location: pickUpCountry, country: state.country);
  }
}
