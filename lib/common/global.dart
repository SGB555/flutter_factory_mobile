import 'dart:convert';

import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences _prefs;
  static User user = User();

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

  /// 保存登录后的用户信息
  static saveUserInfo(User data) =>
      _prefs.setString('userInfo', jsonEncode(data));
}
