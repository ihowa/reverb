import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainState extends Equatable {
  MainState([List props = const []]) : super(props);
}

class InitialState extends MainState {
  @override
  String toString() => 'Initial State';
}

class AppState extends MainState {
  @override
  String toString() => 'Regular State';
}


