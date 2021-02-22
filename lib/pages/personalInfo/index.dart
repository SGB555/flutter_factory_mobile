import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/components/cell.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class PersonalInfo extends StatelessWidget {
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
            )
          ],
        ),
      ),
    );
  }
}
