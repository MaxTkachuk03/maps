part of 'navigation_bloc.dart';

abstract class NavigationEvent {}

class DrawerNavigation extends NavigationEvent {
  DrawerNavigation({
    required this.index,
    required this.route,
  });

  final int index;
  final String route;
}
