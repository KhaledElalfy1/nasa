import 'dart:developer';

import 'package:location/location.dart';

class LocationServices {
  Future<LocationData> getLocation() async {
    Location location = Location();
    LocationData _locationData;

    _locationData = await location.getLocation();

    log("Location: ${_locationData.latitude}, ${_locationData.longitude}");
    return _locationData;
  }
}
