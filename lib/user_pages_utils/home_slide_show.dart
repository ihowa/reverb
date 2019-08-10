import 'package:flutter/material.dart';
import 'card_scroll_widget.dart';

class HomeSlideShow extends StatefulWidget {

  @override
  State<HomeSlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<HomeSlideShow> {
  final _pageCount = 5;
  var currentPage = 5.0;

  PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 5);
    _controller.addListener((){
      setState(() {
        currentPage = _controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CardScrollWidget(currentPage),
        Positioned.fill(
          child: PageView.builder(
            itemCount: _pageCount,
            controller: _controller,
            reverse: true,
            itemBuilder: (context, index){
              return Container(
              );
            },
          ),
        ),
      ],
    );
  }
}