import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/pages/login/components/loginTabView.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/login_bk_image.png'),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            SizedBox(
              width: 166,
              height: 57,
              child: Image.asset('assets/images/Group_15@2x.png'),
            ),
            Expanded(
              child: LoginTabView(),
            ),
          ],
        ),
      ),
    );
  }
}
