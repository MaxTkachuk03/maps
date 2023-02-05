import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/pages/screens/main_view.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState()) {
    on<DrawerNavigation>(
      (event, emit) {
        emit(state.copyWith(
          index: event.index,
          route: event.route,
        ));
      },
    );
  }
}
