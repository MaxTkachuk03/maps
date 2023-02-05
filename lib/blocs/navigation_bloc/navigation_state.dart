part of 'navigation_bloc.dart';

class NavigationState {
  NavigationState({
    this.index = 0,
    this.route = MainView.routeName,
  });

  final int index;
  final String route;

  NavigationState copyWith({
    int? index,
    String? route,
  }) {
    return NavigationState(
      index: index ?? this.index,
      route: route ?? this.route,
    );
  }
}
