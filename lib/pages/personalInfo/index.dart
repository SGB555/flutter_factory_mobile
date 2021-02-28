import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/components/cell.dart';
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
  final picker = ImagePicker();

  String getImgKey() {
    String facId = Global.user.unitId;
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    return facId +
        '_development_' +
        md5.convert(utf8.encode(facId + time)).toString() +
        '.jpg';
  }

  Future<String> getToken() async {
    var res = await SettingRequest().getUploadToken({'appId': 'c4805e2dcc'});
    return res.uptoken;
  }

  /// 获取图片
  /// [type]:0为拍照，1为从相册选择
  Future getImage(num type) async {
    final pickedFile = await picker.getImage(
      source: type == 0 ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedFile != null) {
      String token;
      if (imgToken == null) {
        token = await getToken();
      }
      setState(() {
        imgToken = token;
        imgKey = getImgKey();
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
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
                    'https://image3.myjuniu.com/513d03b1665344e9a629d96dfaae6f63_dev_132a7c175a662d1dd5b3338218109174?imageView/0/w/45/h/45',
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
            )
          ],
        ),
      ),
    );
  }
}
