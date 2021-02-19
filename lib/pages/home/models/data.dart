class Data {
  String id;
  String loginName;
  String userName;
  int type;
  String phone;
  String name;
  String email;
  String bossCode;
  String lastLoginFactoryId;
  String headImg;
  String bossUnitId;

  Data(
      {this.id,
      this.loginName,
      this.userName,
      this.type,
      this.phone,
      this.name,
      this.email,
      this.lastLoginFactoryId,
      this.headImg,
      this.bossUnitId,
      this.bossCode});

  @override
  String toString() {
    return 'Data(id: $id, loginName: $loginName, userName: $userName, type: $type, phone: $phone, name: $name, email: $email, lastLoginFactoryId: $lastLoginFactoryId, headImg: $headImg, bossUnitId: $bossUnitId,bossCode:$bossCode)';
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as String,
      loginName: json['loginName'] as String,
      userName: json['userName'] as String,
      type: json['type'] as int,
      phone: json['phone'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      lastLoginFactoryId: json['lastLoginFactoryId'] as String,
      headImg: json['headImg'] as String,
      bossUnitId: json['bossUnitId'] as String,
      bossCode: json['bossCode'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'loginName': loginName,
      'userName': userName,
      'type': type,
      'phone': phone,
      'name': name,
      'email': email,
      'lastLoginFactoryId': lastLoginFactoryId,
      'headImg': headImg,
      'bossUnitId': bossUnitId,
      'bossCode': bossCode
    };
  }
}
