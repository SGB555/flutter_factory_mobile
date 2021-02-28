import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:flutter_factory_mobile/request/index.dart';

class LoginRequset extends Requset {
  LoginRequset() {
    super.init();
  }

  /// 老板号登录
  Future<User> doLogin(data) async {
    var res = await super.dio.post('v1/api/login/doLogin', data: data);
    return User.fromJson(res.data);
  }

  /// 员工号登录
  Future<User> doWorkbayLogin(data) async {
    var res = await super.dio.post('v1/api/login/workbayLogin', data: data);
    return User.fromJson(res.data);
  }
}
