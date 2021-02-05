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
