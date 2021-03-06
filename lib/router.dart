import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/pages/home/home.dart';
import 'package:flutter_factory_mobile/pages/login/loginPage.dart';
import 'package:flutter_factory_mobile/pages/personalInfo/index.dart';
import 'package:flutter_factory_mobile/pages/test.dart';

const pageMain = Navigator.defaultRouteName;

final Map<String, WidgetBuilder> routes = {
  '/test': (context) => TestPage(),
  pageMain: (context) => LoginPage(),
  '/setting': (context) => MyHomePage(),
  '/personalInfo': (context) => PersonalInfo()
};
