import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;

class AppBlocObserver extends BlocObserver {
  void _log(String emoji, String message) {
    developer.log('$emoji $message');
  }

  @override
  void onCreate(BlocBase bloc) {
    _log("🟢", "Bloc Created: ${bloc.runtimeType}");
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    _log("🔵", "Event: ${bloc.runtimeType}, Event: $event");
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    _log("🟡", "State Change: ${bloc.runtimeType}, Change: $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _log("🔴", "Error in ${bloc.runtimeType}: $error");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    _log("⚪", "Bloc Closed: ${bloc.runtimeType}");
    super.onClose(bloc);
  }
}
