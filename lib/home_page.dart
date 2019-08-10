import 'package:flutter/material.dart';
import 'event_maker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_bloc/main_barrel.dart';
import 'user_pages_utils/home_drawer.dart';
import 'user_pages_utils/home_slide_show.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({Key key, @required this.name}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = MainBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2d3447),
      appBar: AppBar(
        backgroundColor: Color(0xFF2d3447),
        title: Text(widget.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () => showEventDialog(context),
          ),
        ],
      ),
      drawer: HomeDrawer(),
      body: BlocProvider<MainBloc>(
        builder: (context) => _mainBloc,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeSlideShow(),
            ],
          ),
        ),
      ),
    );
  }
}




