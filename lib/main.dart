//import 'package:corretora_app/src/screens/login.dart';
import 'package:corretora_app/src/screens/login/main_login.dart';
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
        initialRoute: '/start',
        routes: {
          '/start': (context) => MainLogin(),
        });
  }
}
