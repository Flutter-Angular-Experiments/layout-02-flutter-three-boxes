import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OrientationBuilder(builder: (context, orientation) {
        return BoxFactory.createBoxes(context, orientation);
      }),
    );
  }
}


class BoxFactory {

  static Widget createBoxes(BuildContext context, Orientation orientation) {

    bool landscape = orientation == Orientation.landscape;

    final double margin = MediaQuery
        .of(context)
        .size
        .width * 0.1;

    return Container(
        color: Colors.white,
        padding: landscape
            ? EdgeInsets.only(right: margin)
            : EdgeInsets.only(bottom: margin),
        child: landscape
            ? Row(children: _createBoxes(margin, landscape: true))
            : Column(
          children: _createBoxes(margin),
        ),
    );
  }

  static List<Box> _createBoxes(double marginValue, {landscape: false}) {
    EdgeInsets margins;
    if (landscape) {
      margins = EdgeInsets.only(
          top: marginValue, bottom: marginValue, left: marginValue);
    } else {
      margins = EdgeInsets.only(
          top: marginValue, left: marginValue, right: marginValue);
    }

    return [
      Box(margins),
      Box(margins),
      Box(margins),
    ];
  }
}



class Box extends StatelessWidget {
  EdgeInsets margins;

  Box(this.margins);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: this.margins,
        color: Colors.green,
      ),
    );
  }
}
