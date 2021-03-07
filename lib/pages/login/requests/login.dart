import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:flutter_factory_mobile/request/requset.dart';

class LoginRequset {
  /// 老板号登录
  static Future<User> doLogin(data) async {
    var res = await HttpManager.getInstance()
        .post('v1/api/login/doLogin', data: data);
    return User.fromJson(res);
  }

  /// 员工号登录
  static Future<User> doWorkbayLogin(data) async {
    var res = await HttpManager.getInstance()
        .post('v1/api/login/workbayLogin', data: data);
    return User.fromJson(res.data);
  }
}
