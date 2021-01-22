import 'package:corretoraApp/src/screens/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF012c5e),
            accentColor: const Color(0xFFc29109)),
        home: new Container(
          width: double.infinity,
          height: double.infinity,
          child: LoginPage(),
        ));
  }
}
