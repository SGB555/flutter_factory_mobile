import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/components/bottomBar.dart';
import 'package:flutter_factory_mobile/pages/home/components/switchFactory.dart';
import 'package:flutter_factory_mobile/pages/home/components/userInfoBox.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title = '123'}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentNavIndex = 3;

  void onTap(int index) {
    setState(() {
      currentNavIndex = index;
    });
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
        onTap: onTap,
      ),
      body: Container(
        color: HexColor('#eeeeee'),
        child: Column(
          children: [UserInfoBox()],
        ),
      ),
    );
  }
}
