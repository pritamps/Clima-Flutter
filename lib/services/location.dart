import 'package:geolocator/geolocator.dart';

class Location {
  double _lat;
  double _long;

  Future<void> getLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _lat = position.latitude;
      _long = position.longitude;
//      print(position);
    } catch (e) {
      print(e);
    }
  }

  getLatitude() {
//    _lat ?? getLocation();
    return _lat;
  }

  getLongitude() {
//    _long ?? getLocation();
    return _long;
  }
}
