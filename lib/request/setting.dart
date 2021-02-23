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

  /// 上传照片
  Future uploadImg(data) async {
    var res = await super.dio.post('v1/api/facUser/getMyInfo', data: data);
    return res;
  }

  /// 获取图片上传token
  Future getUploadToken(data) async {
    var res = await super.dio.post('v1/api/public/getUploadToken', data: data);
    return res;
  }
}
