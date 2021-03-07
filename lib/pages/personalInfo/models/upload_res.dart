class UploadRes {
  String hash;
  String key;

  UploadRes({this.hash, this.key});

  @override
  String toString() => 'UploadToken(hash: $hash,key: $key)';

  factory UploadRes.fromJson(Map<String, dynamic> json) {
    return UploadRes(
      hash: json['hash'] as String,
      key: json['key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'hash': hash, 'key': key};
  }
}
