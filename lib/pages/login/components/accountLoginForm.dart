import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

import 'textFieldWrapper.dart';

// ignore: must_be_immutable
class AccountLoginForm extends StatefulWidget {
  void Function(String fieldName, String val) onSaved;

  AccountLoginForm({Key key, this.onSaved}) : super(key: key);

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
    return Container(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          TextFieldWrapper(
            color: _userNamefocusNode.hasFocus ? HexColor('ff9c38') : null,
            child: TextFormField(
              controller: _unameController,
              focusNode: _userNamefocusNode,
              onSaved: (val) => widget.onSaved('loginName', val),
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
            color: _pwdfocusNode.hasFocus ? HexColor('ff9c38') : null,
            child: TextFormField(
              controller: _pwdController,
              focusNode: _pwdfocusNode,
              onSaved: (val) => widget.onSaved('password', val),
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
    );
  }
}
