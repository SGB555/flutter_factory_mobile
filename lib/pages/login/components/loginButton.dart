import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            child: Container(
              width: double.infinity,
              child: Text(
                '注册账号',
                textAlign: TextAlign.end,
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
            onPressed: null,
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    HexColor('ff9c38'),
                    HexColor('f78848'),
                  ],
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Text(
                '登录',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '云供应链网页端',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.none),
            ),
          ),
          Text(
            'escm.myregent.cn',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                decoration: TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
