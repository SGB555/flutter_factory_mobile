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
