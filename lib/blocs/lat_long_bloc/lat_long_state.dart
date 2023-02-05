part of 'lat_long_bloc.dart';

class LatLongState {
  LatLongState({
    this.lat = 0,
    this.long = 0,
    this.color = 0,
  });
  double lat;
  double long;
  double color;

  LatLongState copyWith({
    double? lat,
    double? long,
    double? color,
  }) {
    return LatLongState(
      lat: lat ?? this.lat,
      long: long ?? this.long,
      color: color ?? this.color,
    );
  }
}
