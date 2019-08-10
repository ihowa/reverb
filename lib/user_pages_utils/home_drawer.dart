import 'package:flutter/material.dart';
import 'package:reverb/authentication_bloc/authentication_barrel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 150.0, left: 40.0, right: 40.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
              onPressed: null,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add),
                  Text("Create Event"),
                ],
              ),
              onPressed: null,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.settings),
                  Text("Settings"),
                ],
              ),
              onPressed: null,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.exit_to_app),
                  Text("Sign Out"),
                ],
              ),
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).dispatch(
                  LoggedOut(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}