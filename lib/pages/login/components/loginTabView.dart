import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTabView extends StatefulWidget {
  @override
  _LoginTabViewState createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView> {
  TabController _tabController;
  List<Widget> _tabChilds = [
    Text(
      '123',
      style: TextStyle(color: Colors.red),
    ),
    Text(
      '456',
      style: TextStyle(color: Colors.red),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabChilds.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.0),
      child: Material(
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              tabs: _tabChilds,
            ),
            TabBarView(
              children: _tabChilds,
              controller: _tabController,
            )
          ],
        ),
      ),
    );
  }
}
