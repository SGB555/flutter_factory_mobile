import "data.dart";

class MyInfo {
	int code;
	String msg;
	Data data;
	int successNum;
	int failNum;

	MyInfo({
		this.code,
		this.msg,
		this.data,
		this.successNum,
		this.failNum,
	});

	@override
	String toString() {
		return 'MyInfo(code: $code, msg: $msg, data: $data, successNum: $successNum, failNum: $failNum)';
	}

	factory MyInfo.fromJson(Map<String, dynamic> json) {
		return MyInfo(
			code: json['code'] as int,
			msg: json['msg'] as String,
			data: json['data'] == null
					? null
					: Data.fromJson(json['data'] as Map<String, dynamic>),
			successNum: json['successNum'] as int,
			failNum: json['failNum'] as int,
		);
	}

	Map<String, dynamic> toJson() {
		return {
			'code': code,
			'msg': msg,
			'data': data?.toJson(),
			'successNum': successNum,
			'failNum': failNum,
		};
	}
}
