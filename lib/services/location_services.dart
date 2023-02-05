import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maps/generated/l10n.dart';

class OurLocation {
  Future<void> permission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("Don't have permission!");
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Don't have permission Forever!");
    }
  }

  LatLng liveLocation({
    required double? lat,
    required double? long,
  }) {
    Location().getLocation().then(
      (LocationData location) {
        lat = location.latitude;
        long = location.longitude;
      },
    );

    return LatLng(lat!, long!);
  }

  Future<void> poliPoints(
    BuildContext context,
    double lat,
    double long,
    double destLat,
    double destLong,
    List<LatLng> polylineCoord,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      S.of(context).apiKey,
      PointLatLng(lat, long),
      PointLatLng(destLat, destLong),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) {
          polylineCoord.add(
            LatLng(
              point.latitude,
              point.longitude,
            ),
          );
        },
      );
    }
  }
}
