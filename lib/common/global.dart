import 'dart:convert';

import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static User user = User();
  static String thumbnail =
      'https://image3.myjuniu.com/513d03b1665344e9a629d96dfaae6f63_dev_132a7c175a662d1dd5b3338218109174?imageView/0/w/45/h/45';

  /// 初始化
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _user = _prefs.getString("userInfo");
    if (_user != null) {
      try {
        user = User.fromJson(jsonDecode(_user));
      } catch (e) {
        print(e);
      }
    }
  }

  /// 保存登录信息
  static saveUserInfo(User data) =>
      _prefs.setString('userInfo', jsonEncode(data));

  /// 保存用户信息
  static saveMyInfo(MyInfo myInfo) =>
      _prefs.setString('myInfo', jsonEncode(myInfo));

  /// 返回用户信息
  static MyInfo getGlobalMyInfo() =>
      MyInfo.fromJson(jsonDecode(_prefs.getString('myInfo')));
}
