import "package:geocoding/geocoding.dart" as geo;
import 'dart:math' as Math;

class Config {
  Future<String> getNameOfStreet(double lat, double long) async {
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat, long);

    var myStreet = placemarks[0].street!;
    return myStreet;
  }

  Future<String> getNameOfQuartier(double lat, double long) async {
    List<geo.Placemark> placemarks =
        await geo.placemarkFromCoordinates(lat, long);

    var quartier = "${placemarks[0].locality!},${placemarks[0].subLocality!}";
    return quartier;
  }

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }
}
