import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/address.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/components/cell.dart';
import 'package:flutter_factory_mobile/pages/home/models/my_info.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';
import 'package:image_picker/image_picker.dart';

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
  static String thumbnail;
  final picker = ImagePicker();

  @override
  initState() {
    super.initState();
    setState(() {
      myInfo = Global.getGlobalMyInfo();
    });
  }

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

  Future<String> getToken() async {
    var res = await SettingRequest.getUploadToken({'appId': 'c4805e2dcc'});
    return res.uptoken;
  }

  String returnPortraitUrl() {
    String url = Global.getGlobalMyInfo().data.headImg;
    if (thumbnail != null) {
      return thumbnail;
    }
    if (url != null) {
      return url + '?imageView/0/w/45/h/45';
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
      await SettingRequest.uploadImg(data: formData);
    } else {
      print('No image selected.');
    }
  }

  handleLogOut(BuildContext context) {
    Navigator.pushReplacementNamed(context, Navigator.defaultRouteName);
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
              value: myInfo.data.userName,
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
