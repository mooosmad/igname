import "package:geocoding/geocoding.dart" as geo;

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
}
