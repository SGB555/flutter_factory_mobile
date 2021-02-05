import "second_menu_list.dart";

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
			secondMenuList: (json['secondMenuList'] as List<SecondMenuList>)?.map((e) {
				return e == null ? null : SecondMenuList.fromJson(e as Map<String, dynamic>);
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
