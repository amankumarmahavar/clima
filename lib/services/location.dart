import 'package:geolocator/geolocator.dart';

class Location {
  double latitude=360, longitude=360;

  Future<bool> isPermissionsGranted() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> getCurrentLocation() async {
    try {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = p.latitude;
      longitude = p.longitude;
    } catch (e) {
      print(e);
    }
  }
}
