class UploadToken {
  String uptoken;

  UploadToken({this.uptoken});

  @override
  String toString() => 'UploadToken(uptoken: $uptoken)';

  factory UploadToken.fromJson(Map<String, dynamic> json) {
    return UploadToken(
      uptoken: json['uptoken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uptoken': uptoken,
    };
  }
}
