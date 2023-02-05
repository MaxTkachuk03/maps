import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/services/location_services.dart';

part 'lat_long_event.dart';
part 'lat_long_state.dart';

class LatLongBloc extends Bloc<LatLongEvent, LatLongState> {
  LatLongBloc() : super(LatLongState()) {
    on<RememberEvent>(
      (event, emit) {
        OurLocation().liveLocation(
          lat: event.lat,
          long: event.long,
        );
        emit(
          state.copyWith(
            lat: event.lat,
            long: event.long,
            color: event.color,
          ),
        );
      },
    );
  }
}
