class User {
  int code;
  String msg;
  Data data;
  int successNum;
  int failNum;
  String facName;
  String logo;
  int viewPicture;
  int downloadAttachments;
  String url;
  String loginName;
  String userId;
  int role;
  String unitId;
  String bossUnitId;
  String factoryFileStorageType;
  int regentMessageId;
  Customization customization;
  List<FirstMenus> firstMenus;
  bool isChargeManage;
  List<String> permissionList;
  String signId;
  String sid;

  User({
    this.code,
    this.msg,
    this.data,
    this.successNum,
    this.failNum,
    this.facName,
    this.logo,
    this.viewPicture,
    this.downloadAttachments,
    this.url,
    this.loginName,
    this.userId,
    this.role,
    this.unitId,
    this.bossUnitId,
    this.factoryFileStorageType,
    this.regentMessageId,
    this.customization,
    this.firstMenus,
    this.isChargeManage,
    this.permissionList,
    this.signId,
    this.sid,
  });

  @override
  String toString() {
    return 'User(code: $code, msg: $msg, data: $data, successNum: $successNum, failNum: $failNum, facName: $facName, logo: $logo, viewPicture: $viewPicture, downloadAttachments: $downloadAttachments, url: $url, loginName: $loginName, userId: $userId, role: $role, unitId: $unitId, bossUnitId: $bossUnitId, factoryFileStorageType: $factoryFileStorageType, regentMessageId: $regentMessageId, customization: $customization, firstMenus: $firstMenus, isChargeManage: $isChargeManage, permissionList: $permissionList, signId: $signId, sid: $sid)';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      code: json['code'] as int,
      msg: json['msg'] as String,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      successNum: json['successNum'] as int,
      failNum: json['failNum'] as int,
      facName: json['facName'] as String,
      logo: json['logo'] as String,
      viewPicture: json['viewPicture'] as int,
      downloadAttachments: json['downloadAttachments'] as int,
      url: json['url'] as String,
      loginName: json['loginName'] as String,
      userId: json['userId'] as String,
      role: json['role'] as int,
      unitId: json['unitId'] as String,
      bossUnitId: json['bossUnitId'] as String,
      factoryFileStorageType: json['factoryFileStorageType'] as String,
      regentMessageId: json['regentMessageId'] as int,
      customization: json['customization'] == null
          ? null
          : Customization.fromJson(
              json['customization'] as Map<String, dynamic>),
      firstMenus: (json['firstMenus'] as List<FirstMenus>)?.map((e) {
        return e == null
            ? null
            : FirstMenus.fromJson(e as Map<String, dynamic>);
      })?.toList(),
      isChargeManage: json['isChargeManage'] as bool,
      permissionList: json['permissionList'] as List<String>,
      signId: json['signId'] as String,
      sid: json['sid'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'msg': msg,
      'data': data?.toJson(),
      'successNum': successNum,
      'failNum': failNum,
      'facName': facName,
      'logo': logo,
      'viewPicture': viewPicture,
      'downloadAttachments': downloadAttachments,
      'url': url,
      'loginName': loginName,
      'userId': userId,
      'role': role,
      'unitId': unitId,
      'bossUnitId': bossUnitId,
      'factoryFileStorageType': factoryFileStorageType,
      'regentMessageId': regentMessageId,
      'customization': customization?.toJson(),
      'firstMenus': firstMenus?.map((e) => e?.toJson())?.toList(),
      'isChargeManage': isChargeManage,
      'permissionList': permissionList,
      'signId': signId,
      'sid': sid,
    };
  }
}

class Data {
  int expires;
  String token;

  Data({this.expires, this.token});

  @override
  String toString() {
    return 'Data(expires: $expires, token: $token)';
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      expires: json['expires'] as int,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'expires': expires,
      'token': token,
    };
  }
}

class Customization {
  bool mengyan_278;

  Customization({this.mengyan_278});

  @override
  String toString() {
    return 'Customization(mengyan_278: $mengyan_278)';
  }

  factory Customization.fromJson(Map<String, dynamic> json) {
    return Customization(
      mengyan_278: json['MENGYAN_278'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'MENGYAN_278': mengyan_278,
    };
  }
}

class SecondMenuList {
  String name;

  SecondMenuList({this.name});

  @override
  String toString() => 'SecondMenuList(name:$name)';

  factory SecondMenuList.fromJson(Map<String, dynamic> json) {
    return SecondMenuList(name: json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}

class FirstMenus {
  String name;
  List<SecondMenuList> secondMenuList;

  FirstMenus({this.name, this.secondMenuList});

  @override
  String toString() {
    return 'FirstMenus(name: $name, secondMenuList: $secondMenuList)';
  }

  factory FirstMenus.fromJson(Map<String, dynamic> json) {
    return FirstMenus(
      name: json['name'] as String,
      secondMenuList:
          (json['secondMenuList'] as List<SecondMenuList>)?.map((e) {
        return e == null
            ? null
            : SecondMenuList.fromJson(e as Map<String, dynamic>);
      })?.toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'secondMenuList': secondMenuList?.map((e) => e?.toJson())?.toList(),
    };
  }
}
