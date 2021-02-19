//import 'package:corretora_app/src/screens/login/main_login.dart';
import 'package:corretora_app/src/screens/login/main_login.dart';
import 'package:corretora_app/src/screens/login/token.dart';
import 'package:corretora_app/src/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF00325d),
            accentColor: const Color(0xFFc9920e)),
        initialRoute: '/start',
        routes: {
          '/start': (context) => MainLogin(),
          '/login/token': (context) => TokenPage(),
          '/home': (context) => HomePage(),
        });
  }
}
