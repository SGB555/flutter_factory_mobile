import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/router.dart';
import 'package:flutter_factory_mobile/splash/index.dart';

void main() {
  runApp(PageSplash(
    futures: [],
    builder: (context, data) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '云供应链',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      initialRoute: '/login',
    );
  }
}
