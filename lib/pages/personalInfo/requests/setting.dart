import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/pages/personalInfo/models/models/upload_token.dart';
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
  Future<UploadToken> getUploadToken(
      Map<String, dynamic> queryParameters) async {
    var res = await super
        .dio
        .get('v1/api/public/getUploadToken', queryParameters: queryParameters);
    return UploadToken.fromJson(res.data);
  }
}
