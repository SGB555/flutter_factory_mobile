import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/request/index.dart';

class SettingRequest extends Requset {
  SettingRequest() {
    super.init();
  }

  /// 获取用户信息
  Future<MyInfo> getMyInfo(data) async {
    var res = await super.dio.post('v1/api/facUser/getMyInfo', data: data);
    return MyInfo.fromJson(res.data);
  }
}
