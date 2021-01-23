import 'package:flutter/material.dart';

class TextFieldWrapper extends StatelessWidget {
  // MyHomePage({Key key, this.title = '123'}) : super(key: key);
  final Color color;
  final Widget child;
  final double width;
  TextFieldWrapper({this.color, this.child, this.width})
      : assert(child != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: new Border.all(
            color: color != null ? color : Color.fromARGB(255, 230, 232, 235),
            width: 0.5),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
      child: child,
    );
  }
}
