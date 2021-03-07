import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/components/cell.dart';
import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'models/upload_res.dart';
import 'requests/setting.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  static File _image;
  static String imgKey;
  static String imgToken;
  static MyInfo myInfo;
  static String thumbnail = Global.getGlobalMyInfo().data.headImg;
  static String userName = Global.getGlobalMyInfo().data.userName;
  final picker = ImagePicker();

  @override
  initState() {
    super.initState();
    setState(() {
      myInfo = Global.getGlobalMyInfo();
    });
  }

  /// 获取图片上传key
  getImgKey() {
    if (imgKey == null) {
      String facId = Global.user.unitId;
      String time = DateTime.now().millisecondsSinceEpoch.toString();
      return facId +
          '_development_' +
          md5.convert(utf8.encode(facId + time)).toString() +
          '.jpg';
    }
  }

  /// 获取图片上传token
  Future<String> getToken() async {
    var res = await SettingRequest.getUploadToken({'appId': 'c4805e2dcc'});
    return res.uptoken;
  }

  /// 返回头像地址
  String returnPortraitUrl() {
    if (thumbnail != null) {
      return thumbnail + '?imageView/0/w/45/h/45';
    }
    return Global.thumbnail;
  }

  /// 获取图片
  /// [type]:0为拍照，1为从相册选择
  Future getImage(num type) async {
    final pickedFile = await picker.getImage(
      source: type == 0 ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedFile != null) {
      String token;
      String key;
      if (imgToken == null) {
        token = await getToken();
      }
      key = getImgKey();
      setState(() {
        imgToken = token;
        imgKey = getImgKey();
        _image = File(pickedFile.path);
      });
      FormData formData =
          FormData.fromMap({'file': _image, 'key': key, 'token': token});
      UploadRes res = await SettingRequest.uploadImg(data: formData);
      setState(() {
        thumbnail = 'https://image3.myjuniu.com/' + res.key;
        handleUpdate();
      });
    } else {
      print('No image selected.');
    }
  }

  /// 退出登录事件
  handleLogOut(BuildContext context) {
    Navigator.pushReplacementNamed(context, Navigator.defaultRouteName);
  }

  /// 更新用户信息事件
  handleUpdate() async {
    Map params = {
      'headImg': thumbnail,
      'userId': Global.user.userId,
      'userName': userName
    };
    await SettingRequest.updateMyInfo(params);
    Fluttertoast.showToast(
      msg: '操作成功',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // 弹出对话框
  Future<bool> showLogOutConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("是否退出当前账号?"),
          actions: <Widget>[
            FlatButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("确定"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
                handleLogOut(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget bottomSheetContent(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlatButton(
          child: Text('拍照'),
          onPressed: () async => {
            await getImage(0),
            Navigator.of(context).pop(),
          },
        ),
        Divider(
          height: 20.0,
        ),
        FlatButton(
          child: Text('从相册选择'),
          onPressed: () => {
            getImage(1),
            Navigator.of(context).pop(),
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人资料'),
      ),
      body: Container(
        color: HexColor('#eeeeee'),
        child: Column(
          children: [
            Cell(
              title: '头像',
              rightWidget: Row(
                children: [
                  Image.network(
                    returnPortraitUrl(),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right_outlined,
                    color: HexColor('#a2abb8'),
                  )
                ],
              ),
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return bottomSheetContent(context);
                  }),
            ),
            Cell(
              title: '姓名',
              value: userName,
              isLink: true,
            ),
            Cell(
              title: '老板号',
              value: myInfo.data.loginName,
              isLink: true,
            ),
            Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      '退出登录',
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => showLogOutConfirm(context),
                    color: HexColor('#ffffff'),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
