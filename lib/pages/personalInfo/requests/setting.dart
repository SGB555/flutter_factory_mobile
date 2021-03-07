import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/pages/personalInfo/models/upload_res.dart';
import 'package:flutter_factory_mobile/pages/personalInfo/models/upload_token.dart';
import 'package:flutter_factory_mobile/request/requset.dart';

class SettingRequest {
  /// 获取用户信息
  static Future<MyInfo> getMyInfo(data) async {
    var res = await HttpManager.getInstance()
        .post('v1/api/facUser/getMyInfo', data: data);
    return MyInfo.fromJson(res);
  }

  /// 上传照片
  static Future<UploadRes> uploadImg({data}) async {
    var res =
        await HttpManager.getInstance(baseUrl: 'https://upload-z2.qiniup.com')
            .post('', data: data);
    return UploadRes.fromJson(res);
  }

  /// 获取图片上传token
  static Future<UploadToken> getUploadToken(Map<String, dynamic> params) async {
    var res = await HttpManager.getInstance()
        .get('v1/api/public/getUploadToken', params: params);
    return UploadToken.fromJson(res);
  }

  /// 更新用户信息
  static Future updateMyInfo(data) async {
    var res = await HttpManager.getInstance()
        .post('v1/api/facUser/updateMyInfo', data: data);
    return res;
  }
}
