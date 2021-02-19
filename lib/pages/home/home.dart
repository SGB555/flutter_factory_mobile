import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/components/bottomBar.dart';
import 'package:flutter_factory_mobile/components/cell.dart';
import 'package:flutter_factory_mobile/pages/home/components/switchFactory.dart';
import 'package:flutter_factory_mobile/pages/home/components/userInfoBox.dart';
import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/request/setting.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = '123'}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentNavIndex = 3;
  var myInfo = null;

  void onNavTap(int index) {
    setState(() {
      currentNavIndex = index;
    });
  }

  Future<MyInfo> fetchMyInfo() async {
    var data = {'userId': Global.user.userId, 'token': ''};
    var res = await SettingRequest().getMyInfo(data);
    return res;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchMyInfo();
  // }

  void onCallsCellTap() async {
    const url = 'tel:4006785498';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
          actions: [SwitchFactory()],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: currentNavIndex,
          onTap: onNavTap,
        ),
        body: FutureBuilder(
          future: fetchMyInfo(),
          builder: (BuildContext context, AsyncSnapshot<MyInfo> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                color: HexColor('#eeeeee'),
                child: Column(
                  children: [
                    UserInfoBox(
                      myInfo: snapshot.data,
                    ),
                    Cell(
                      icon: Icon(
                        Icons.phone_forwarded_outlined,
                      ),
                      isLink: true,
                      value: '400-678-5498',
                      title: '联系客服',
                      onTap: () => onCallsCellTap(),
                    ),
                    Cell(
                      icon: Icon(Icons.info_outline),
                      isLink: true,
                      value: '版本号：',
                      title: '关于',
                    )
                  ],
                ),
              );
            } else {
              return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          },
        ));
  }
}
