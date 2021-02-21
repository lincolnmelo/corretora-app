import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/app_bar.dart';
import 'package:corretora_app/src/components/drawer.dart';

class RendaFixaPage extends StatefulWidget {
  @override
  _RendaFixaPageState createState() => _RendaFixaPageState();
}

class _RendaFixaPageState extends State<RendaFixaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: Text('Renda Fixa'),
        appBar: AppBar(),
      ),
      drawer: DrawerComponent(),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Center(child: Text("Renda Fixa"))),
    );
  }
}
