import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class Cell extends StatelessWidget {
  /// 左侧文案
  final String title;

  /// 右侧文案
  final String value;

  /// 图标
  final Icon icon;

  /// 暂时箭头
  final bool isLink;

  /// 点击事件
  final GestureTapCallback onTap;

  const Cell(
      {Key key, this.title, this.value, this.icon, this.isLink, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? null,
      child: Container(
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon ?? Container(),
                Container(
                  child: Text(
                    title ?? '',
                    style: TextStyle(color: Colors.black),
                  ),
                  padding: icon != null
                      ? EdgeInsets.only(left: 10)
                      : EdgeInsets.all(0),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  value ?? '',
                  style: TextStyle(
                    color: HexColor('#a2abb8'),
                  ),
                ),
                isLink
                    ? Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: HexColor('#a2abb8'),
                      )
                    : Container()
              ],
            )
          ],
        ),
      ),
    );
  }
}
