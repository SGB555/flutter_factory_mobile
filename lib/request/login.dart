import 'package:flutter_factory_mobile/models/user.dart';
import 'package:flutter_factory_mobile/request/index.dart';

class LoginRequset extends Requset {
  Future<User> doLogin(String loginName, String password) async {
    var res = await super.dio.post('v1/api/login/doLogin');
    return User.fromJson(res.data);
  }
}
