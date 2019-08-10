import 'package:bloc/bloc.dart';
import 'main_state.dart';
import 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState>{

  @override
  MainState get initialState => InitialState();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if(event is AppOpened) {

    }
  }


}