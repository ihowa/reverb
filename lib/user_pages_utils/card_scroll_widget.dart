import 'package:flutter/material.dart';
import 'dart:math';


final cardAspectRatio = 12.0/16.0;
final widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget {
  final currentPage;
  final padding = 20.0;
  final verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;

          final safeWidth = width - 2 * padding;
          final safeHeight = height - 2 * padding;

          final heightOfPrimaryCard = safeHeight;
          final widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

          final primaryCardLeft = safeWidth - widthOfPrimaryCard;
          final horizontalInset = primaryCardLeft / 2;

          List<Widget> cardList = List();

          for (int i = 0; i < 5; i++) {
            final delta = i - currentPage;
            bool isOnRight = delta > 0;

            final start = padding + max(primaryCardLeft -
                horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

            final cardItem = Positioned.directional(
              top: padding + verticalInset * max(-delta, 0.0),
              bottom: padding + verticalInset * max(-delta, 0.0),
              start: start,
              textDirection: TextDirection.rtl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3.0, 6.0),
                        blurRadius: 10.0,
                      )
                    ]
                  ),
                  child: AspectRatio(
                    aspectRatio: cardAspectRatio,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        /*SvgPicture.asset(
                          "assets/bugfixing.svg", fit: BoxFit.cover,),*/
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Text("BDVIYFGI",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontFamily: "SF-Pro-Text-Regular"
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            );
            cardList.add(cardItem);
          }
          return Stack(
            children: cardList,
          );
        }
      ),
    );
  }
}