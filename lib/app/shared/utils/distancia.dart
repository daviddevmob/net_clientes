import 'package:latlong/latlong.dart';

class DistanciaCalculo {
  double getDistacia(double userLat, double userLong, double lat, double lng) {
    final Distance distance = new Distance();
    final double distancia = distance.as(
      LengthUnit.Kilometer,
      LatLng(userLat, userLong),
      LatLng(lat, lng),
    );

    return distancia;
  }
}
