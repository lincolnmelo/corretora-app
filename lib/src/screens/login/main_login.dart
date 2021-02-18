import 'dart:async';
import 'package:flutter/material.dart';
import 'package:corretora_app/src/screens/login/login.dart';
import 'package:corretora_app/src/screens/login/start.dart';

class MainLogin extends StatefulWidget {
  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  bool starting = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      starting = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _setState());
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: starting ? StartPage() : LoginPage());
  }

  _setState() {
    Timer(
        Duration(milliseconds: 1500),
        () => setState(() {
              starting = false;
            }));
  }
}
