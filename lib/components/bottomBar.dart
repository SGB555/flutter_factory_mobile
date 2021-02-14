import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomBar({Key key, this.currentIndex = 0, this.onTap})
      : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  /// 底部导航栏item
  final List<BottomBarItem> bottomNavigationBarItems = [
    BottomBarItem('fac.mission.list', Icon(Icons.article_outlined),
        Icon(Icons.article), '工单', '/mission'),
    BottomBarItem('fac.materials2', Icon(Icons.shopping_cart_outlined),
        Icon(Icons.shopping_cart), '物料', '/material'),
    BottomBarItem('fac.inventory', Icon(Icons.store_mall_directory_outlined),
        Icon(Icons.store), '库存', '/repertory'),
    BottomBarItem(
        '', Icon(Icons.person_outline), Icon(Icons.person), '我的', '/setting'),
  ];

  void onItemTap(BuildContext context, int index) {
    String permissionCode = bottomNavigationBarItems[index].permissionCode;
    String routePath = bottomNavigationBarItems[index].routePath;
    bool permission = permissionCode == '' ||
        Global.user.permissionList.contains(permissionCode);
    if (permission) {
      // Navigator.pushNamed(context, routePath);
      widget.onTap(index);
    } else {
      Fluttertoast.showToast(
        msg: '暂无权限',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bottomNavigationBarItems,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      onTap: (index) => onItemTap(context, index),
    );
  }
}

class BottomBarItem extends BottomNavigationBarItem {
  final String permissionCode;
  final Widget icon;
  final Widget activeIcon;
  final String label;
  final String routePath;
  BottomBarItem(
    this.permissionCode,
    this.icon,
    this.activeIcon,
    this.label,
    this.routePath,
  ) : super(icon: icon);
}
