part of 'lat_long_bloc.dart';

abstract class LatLongEvent {}

class RememberEvent extends LatLongEvent{
  RememberEvent({
    this.lat = 0,
    this.long = 0,
    this.color = 0,
  });
  double lat;
  double long;
  double color;
}
