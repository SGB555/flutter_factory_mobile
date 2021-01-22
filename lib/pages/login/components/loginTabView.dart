import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/pages/login/components/accountLoginForm.dart';

class LoginTabView extends StatefulWidget {
  @override
  _LoginTabViewState createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  /// tab文案数组
  List<Widget> _tabChilds = [
    Text(
      '账号登录',
      style: TextStyle(color: Colors.black, fontSize: 16.0, height: 4),
    ),
    Text(
      '工位登录',
      style: TextStyle(color: Colors.black, fontSize: 16.0, height: 4),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabChilds.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0),
      child: Material(
        child: Container(
          height: 550,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/login_bk_image.png'),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                tabs: _tabChilds,
                indicatorColor: Colors.black,
                indicatorPadding: EdgeInsets.only(top: 10),
                indicatorWeight: 3.0,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [AccountLoginForm(), Text('2')],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
