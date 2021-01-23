import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/pages/login/components/accountLoginForm.dart';
import 'package:flutter_factory_mobile/pages/login/components/staffLoginForm.dart';

import 'loginButton.dart';

class LoginTabView extends StatefulWidget {
  @override
  _LoginTabViewState createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  /// 账号登录 formKey
  GlobalKey _accountFormKey = new GlobalKey<FormState>();

  /// 工位登录 formKey
  GlobalKey _staffFormKey = new GlobalKey<FormState>();

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

  /// 登录按钮点击事件
  void handleLogin() {
    GlobalKey key = _tabController.index == 0 ? _accountFormKey : _staffFormKey;
    if ((key.currentState as FormState).validate()) {
      //验证通过提交数据
      (key.currentState as FormState).save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Material(
        child: Container(
          height: 400,
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
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AccountLoginForm(
                        formKey: _accountFormKey,
                      ),
                      StaffLoginForm(
                        formKey: _staffFormKey,
                      )
                    ],
                  ),
                ),
              ),
              LoginButton(
                onPressed: handleLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
