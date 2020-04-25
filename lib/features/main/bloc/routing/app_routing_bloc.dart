import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/main/bloc/routing/app_routing_events.dart';
import 'package:news_app/features/main/bloc/routing/app_routing_states.dart';

class AppRoutingBloc extends Bloc<AppRoutingEvent, AppRoutingState> {
  @override
  AppRoutingState get initialState => AppRoutingStateInitial();

  @override
  Stream<AppRoutingState> mapEventToState(AppRoutingEvent event) async* {
    if (event is ShowNews) {
      yield* _mapShowNewsToState(event);
    } else if (event is ShowSettings) {
      yield* _mapShowSettingsToState(event);
    }
  }

  Stream<AppRoutingState> _mapShowNewsToState(ShowNews event) async* {
    yield AppRoutingStateNews();
  }

  Stream<AppRoutingState> _mapShowSettingsToState(ShowSettings event) async* {
    yield AppRoutingStateSettings();
  }

}