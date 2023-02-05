import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/blocs/lat_long_bloc/lat_long_bloc.dart';
import 'package:maps/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:maps/pages/screens/main_view.dart';
import 'package:maps/routes/routes.dart';
import 'package:maps/widgets/navigation/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static const String routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _onSelectTab(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (_) => false, //  або     (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // або можна так: BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
          // create: (context) => NavigationBloc(),
        ),
         BlocProvider(
          create: (_) => LatLongBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            drawer: CustomDrawer(
              onTap: _onSelectTab,
            ),
            body: Navigator(
              key: _navigatorKey,
              initialRoute: MainView.routeName,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          );
        },
        listener: (_, state) {
          _onSelectTab(state.route);
        },
      ),
    );
  }
}
