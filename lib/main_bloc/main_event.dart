import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MainEvent extends Equatable {
  MainEvent([List props = const []]) : super(props);
}

class AppOpened extends MainEvent {
  @override
  String toString() => 'App Opened';
}

class Scroll extends MainEvent {
  @override
  String toString() => 'Scroll';
}

class NextSlide extends MainEvent {
  @override
  String toString() => 'Next Slide';
}

class EventCreated extends MainEvent {

  @override
  String toString() => 'Event Created';
}
