import 'dart:async';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool starting = false;
  bool isOpacity = false;

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: isOpacity ? 0.0 : 1.0,
          child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Container(child: logoContent()))),
    );
  }

  Widget logoContent() {
    return Center(
        child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            width: starting ? 0 : 250,
            child: new Image.asset(
              "lib/assets/images/alfa-corretora-branco.png",
            )));
  }

  _setState() {
    setState(() {
      starting = false;
    });
    Timer(
        Duration(milliseconds: 1500),
        () => setState(() {
              isOpacity = true;
            }));
  }
}
