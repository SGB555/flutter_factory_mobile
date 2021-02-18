import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class UserInfoBox extends StatefulWidget {
  @override
  _UserInfoBoxState createState() => _UserInfoBoxState();
}

class _UserInfoBoxState extends State<UserInfoBox> {
  String returnUserName() {
    int role = Global.user.role;
    String bossName = Global.user.loginName;
    // String staffName = Global.user
    if (role == 1) {
      return bossName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            HexColor('#262f3b'),
            HexColor('#414e5f'),
          ],
        ),
      ),
      height: 68.0,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(5)),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://image3.myjuniu.com/513d03b1665344e9a629d96dfaae6f63_dev_132a7c175a662d1dd5b3338218109174?imageView/0/w/45/h/45',
                  height: 48.0,
                  width: 48.0,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'test-test',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '分组：',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: HexColor('#929fb2'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: null,
          )
        ],
      ),
    );
  }
}
