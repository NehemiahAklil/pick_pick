import 'package:pick_pick/domain/place.dart';
import 'country.dart';

class ShippingInformation {
  ShippingInformation({
    required this.location,
    required this.country,
    this.specificLocation,
  });

  Place location;
  String? specificLocation;
  Country country;
}
