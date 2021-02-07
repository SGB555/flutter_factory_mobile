import 'package:flutter/material.dart';
import 'package:flutter_factory_mobile/common/global.dart';
import 'package:flutter_factory_mobile/router.dart';
import 'package:flutter_factory_mobile/splash/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PageSplash(
    futures: [
      Global.init(),
    ],
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
        primaryColor: Colors.orange[400],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      initialRoute: '/login',
    );
  }
}
