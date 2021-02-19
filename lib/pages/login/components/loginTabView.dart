import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/pages/login/components/accountLoginForm.dart';
import 'package:flutter_factory_mobile/pages/login/components/staffLoginForm.dart';
import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:flutter_factory_mobile/request/login.dart';
import 'package:date_format/date_format.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'loginButton.dart';

class LoginTabView extends StatefulWidget {
  @override
  _LoginTabViewState createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static String appId = 'c4805e2dcc';

  static String appSecret = '81e691f588764310';

  static String date =
      formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd, '-', HH]);

  static String sign =
      md5.convert(utf8.encode('$appId$appSecret/$date')).toString();

  /// 老板登录参数
  static Map<String, String> accountFormParams = {
    'loginName': '',
    'password': '',
    'appId': appId,
    'sign': sign
  };

  /// 工位登录参数
  static Map<String, String> staffFormParams = {
    'loginName': '',
    'password': '',
    'bossCode': '',
    'appId': appId,
    'sign': sign
  };

  static bool loading = false;

  /// formKey
  GlobalKey _formKey = new GlobalKey<FormState>();

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
  void handleLogin(BuildContext context) async {
    if ((_formKey.currentState as FormState).validate()) {
      // 验证通过提交数据
      (_formKey.currentState as FormState).save();
      User userRes;
      loading = true;
      // 如果是账号登录tab时则是老板号登录
      if (_tabController.index == 0) {
        userRes = await this.handleBossLogin();
      } else {
        userRes = await this.handleStaffLogin();
      }
      loading = false;
      if (userRes.code == 0) {
        Global.saveUserInfo(userRes);
        Navigator.pushReplacementNamed(context, '/setting');
      }
      Fluttertoast.showToast(
        msg: userRes.msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  /// 老板号登录
  Future<User> handleBossLogin() async {
    accountFormParams['password'] = transformPwd(accountFormParams['password']);
    User user = await LoginRequset().doLogin(accountFormParams);
    return user;
  }

  /// 员工号登录
  Future<User> handleStaffLogin() async {
    staffFormParams['password'] = transformPwd(staffFormParams['password']);
    User user = await LoginRequset().doWorkbayLogin(staffFormParams);
    print(user.toString());
    return user;
  }

  /// 接收账户登录form数据
  void accepAccountParams(String fieldName, String val) {
    accountFormParams[fieldName] = val;
  }

  // 接收工位登录form数据
  void acceptStaffFormParams(String fieldName, String val) {
    staffFormParams[fieldName] = val;
  }

  /// 转换密码为MD5
  String transformPwd(String password) {
    return md5.convert(utf8.encode(password)).toString();
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
                  child: Form(
                    key: _formKey,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        AccountLoginForm(
                          onSaved: accepAccountParams,
                          onFieldSubmitted: () => handleLogin(context),
                        ),
                        StaffLoginForm(
                          onSaved: acceptStaffFormParams,
                          onFieldSubmitted: () => handleLogin(context),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              LoginButton(
                onPressed: !loading ? () => handleLogin(context) : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
