import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/blocs/lat_long_bloc/lat_long_bloc.dart';
import 'package:maps/generated/l10n.dart';
import 'package:maps/resourses/colors.dart';
import 'package:maps/resourses/icons.dart';
import 'package:maps/services/location_services.dart';
import 'package:maps/widgets/dialog_windows/user_info.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'screens/main_viev';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  static const destination = LatLng(
    37.33429383,
    -122.03272188,
  );
  List<LatLng> polylineCoord = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatLongBloc, LatLongState>(
      builder: (context, state) {
        OurLocation().poliPoints(
          context,
          // 37.33500926,
          // -122.03272188,
          state.lat,
          state.long,
          destination.latitude,
          destination.longitude,
          polylineCoord,
        );
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: SvgPicture.asset(
                AppIcons.drawer,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          body: state.lat == null && state.long == null
              ? const CircularProgressIndicator()
              : Stack(
                  children: [
                    GoogleMap(
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          // 37.33500926,
                          // -122.03272188,
                          state.lat,
                          state.long,
                        ),
                        zoom: 14.5,
                      ),
                      polylines: {
                        Polyline(
                          polylineId: PolylineId(
                            FirebaseAuth.instance.currentUser!.displayName!,
                          ),
                          points: polylineCoord,
                          color: AppColors.blue,
                        ),
                      },
                      markers: {
                        Marker(
                          markerId: MarkerId(
                            S.of(context).info,
                          ),
                          position: LatLng(
                            // 37.33500926,
                            // -122.03272188,
                            state.lat,
                            state.long,
                          ),
                          infoWindow: InfoWindow(
                            title:
                                FirebaseAuth.instance.currentUser!.displayName!,
                            onTap: () {
                              areYouSureAboutNumber(
                                context,
                              );
                            },
                          ),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            state.color,
                          ),
                        ),
                        Marker(
                          markerId: MarkerId(
                            S.of(context).route,
                          ),
                          position: destination,
                        ),
                      },
                    ),
                  ],
                ),
        );
      },
    );
  }
}
