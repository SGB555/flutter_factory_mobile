import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountLoginForm extends StatefulWidget {
  @override
  _AccountLoginFormState createState() => _AccountLoginFormState();
}

class _AccountLoginFormState extends State<AccountLoginForm> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  FocusNode _userNamefocusNode = new FocusNode();
  FocusNode _pwdfocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _userNamefocusNode.addListener(() => setState(() => {}));
    _pwdfocusNode.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  TextFieldWrapper(
                    color: _userNamefocusNode.hasFocus ? Colors.red : null,
                    child: TextFormField(
                      autofocus: true,
                      controller: _unameController,
                      focusNode: _userNamefocusNode,
                      decoration: InputDecoration(
                        hintText: "请输入手机号或老板号",
                        border: InputBorder.none,
                        icon: Icon(Icons.person_outline, color: Colors.grey),
                      ),
                      // 校验用户名
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                    ),
                  ),
                  TextFieldWrapper(
                    color: _pwdfocusNode.hasFocus ? Colors.red : null,
                    child: TextFormField(
                      controller: _pwdController,
                      focusNode: _pwdfocusNode,
                      decoration: InputDecoration(
                        hintText: "请输入密码",
                        border: InputBorder.none,
                        icon: Icon(Icons.lock_outline, color: Colors.grey),
                      ),
                      obscureText: true,
                      //校验密码
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  FlatButton(
                    child: Text('注册账号'),
                    onPressed: null,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                      width: double.infinity,
                      child: const Text(
                        '登录',
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextFieldWrapper extends StatelessWidget {
  // MyHomePage({Key key, this.title = '123'}) : super(key: key);
  final Color color;
  final Widget child;
  TextFieldWrapper({this.color, this.child}) : assert(child != null);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: new Border.all(
            color: color != null ? color : Color.fromARGB(255, 230, 232, 235),
            width: 0.5),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 10),
      child: child,
    );
  }
}
