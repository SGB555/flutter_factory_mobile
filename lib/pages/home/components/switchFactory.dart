import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class SwitchFactory extends StatefulWidget {
  @override
  _SwitchFactoryState createState() => _SwitchFactoryState();
}

class _SwitchFactoryState extends State<SwitchFactory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            Icons.swap_horiz,
          ),
          FlatButton(
            child: Text(
              '切换工厂',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}
