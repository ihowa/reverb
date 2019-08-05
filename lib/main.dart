import 'package:flutter/material.dart';
import 'authentication_bloc/authentication_barrel.dart';
import 'user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'bloc_delegate.dart';
import 'uninitialized_screen.dart';
import 'user_auth/login_page.dart';
import 'home_page.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => _authenticationBloc,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if(state is Uninitialized) {
              return UninitializedScreen();
            }
            if(state is Authenticated) {
              return HomePage(name: state.displayName);
            }
            if(state is Unauthenticated) {
              return LoginPage(userRepository: _userRepository,);
            }
            return SizedBox(height: 0.0, width: 0.0,);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
