import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reverb/user_repository.dart';
import 'package:reverb/register_bloc/register_barrel.dart';
import 'register_form.dart';

class RegisterPage extends StatefulWidget {
  final UserRepository _userRepository;

  RegisterPage({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc _registerBloc;

  @override
  void initState() {
    super.initState();
    _registerBloc = RegisterBloc(
      userRepository: widget._userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<RegisterBloc>(
          builder: (context) => _registerBloc,
          child: RegisterForm(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _registerBloc.dispose();
    super.dispose();
  }
}