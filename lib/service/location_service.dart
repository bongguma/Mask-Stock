import 'package:geolocator/geolocator.dart';

class LocationService {

  // 현재 위치에 대한 좌표를 가져오는 API
  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}