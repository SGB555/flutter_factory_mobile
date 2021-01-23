import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/pages/login/components/textFieldWrapper.dart';
import 'package:flutter_factory_mobile/utils/hexColor.dart';

class StaffLoginForm extends StatefulWidget {
  final GlobalKey formKey;

  const StaffLoginForm({Key key, this.formKey}) : super(key: key);

  @override
  _StaffLoginFormState createState() => _StaffLoginFormState();
}

class _StaffLoginFormState extends State<StaffLoginForm> {
  FocusNode _bossNumFocusNode = new FocusNode();
  FocusNode _numFocusNode = new FocusNode();
  FocusNode _pwdFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _bossNumFocusNode.addListener(() => setState(() => {}));
    _numFocusNode.addListener(() => setState(() => {}));
    _pwdFocusNode.addListener(() => setState(() => {}));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFieldWrapper(
                  color: _bossNumFocusNode.hasFocus ? HexColor('ff9c38') : null,
                  child: TextFormField(
                    focusNode: _bossNumFocusNode,
                    decoration: InputDecoration(
                      hintText: "老板号",
                      border: InputBorder.none,
                      icon: Icon(Icons.person_outline, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Container(
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
              ),
              Expanded(
                child: TextFieldWrapper(
                  color: _numFocusNode.hasFocus ? HexColor('ff9c38') : null,
                  child: TextFormField(
                    focusNode: _numFocusNode,
                    decoration: InputDecoration(
                      hintText: "编号",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            ],
          ),
          TextFieldWrapper(
            color: _pwdFocusNode.hasFocus ? HexColor('ff9c38') : null,
            child: TextFormField(
              focusNode: _pwdFocusNode,
              decoration: InputDecoration(
                hintText: "请输入工位密码",
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
