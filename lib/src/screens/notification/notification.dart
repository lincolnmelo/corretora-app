import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/app_bar.dart';
import 'package:corretora_app/src/components/drawer.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: Text('Notificações'),
        appBar: AppBar(),
      ),
      drawer: DrawerComponent(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text("Minhas Notificações"))),
    );
  }
}
