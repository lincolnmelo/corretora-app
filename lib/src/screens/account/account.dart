import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/app_bar.dart';
import 'package:corretora_app/src/components/drawer.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: Text('Minha conta'),
        appBar: AppBar(),
      ),
      drawer: DrawerComponent(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text("Minha Conta"))),
    );
  }
}
