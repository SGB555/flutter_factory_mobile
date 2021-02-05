import 'package:flutter_factory_mobile/pages/login/models/user.dart';
import 'package:flutter_factory_mobile/request/index.dart';

class LoginRequset extends Requset {
  LoginRequset() {
    super.init();
  }
  Future<User> doLogin(data) async {
    var res = await super.dio.post('v1/api/login/doLogin', data: data);
    return User.fromJson(res.data);
  }
}
