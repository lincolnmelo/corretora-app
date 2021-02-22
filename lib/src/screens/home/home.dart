import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/app_bar.dart';
import 'package:corretora_app/src/components/drawer.dart';
import 'package:corretora_app/src/components/graphic.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent(
          title: Text('Home Dashboard'),
          appBar: AppBar(),
        ),
        drawer: DrawerComponent(),
        body: graphic());
  }

  Widget graphic() {
    return GraphicsComponent();
  }
}
