import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/app_bar.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final colorDivider = Colors.grey[600];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: Text('Minha conta'),
        appBar: AppBar(),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: contentPerson()),
    );
  }

  Widget contentPerson() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [infoPerson(), listOptions(), logoContent()],
      ),
    );
  }

  Widget infoPerson() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 80.0,
              height: 80.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new AssetImage("lib/assets/images/avatar.png")))),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('TESTE DE TESTE',
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Agência: 0000 | conta: 00000-0',
                    style: TextStyle(
                        fontSize: 12, color: Theme.of(context).primaryColor)),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: divider(0.5, 0, 0, colorDivider),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget listOptions() {
    return Column(
      children: [
        options('Informações pessoais', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
        options('Alterar Senha', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
        options('Biometria', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
        options('Gerenciar dispositivos', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
        options('Meus limites', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
        options('Atualização cadastral', Icon(Icons.chevron_right)),
        divider(0.5, 20, 0, colorDivider),
      ],
    );
  }

  Widget options(String _text, Icon _incon) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 20), child: Text(_text)))),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: IconButton(
                        icon: _incon,
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          print("Clicou");
                        }),
                  ))),
        ],
      ),
    );
  }

  Widget divider(
      double _thickness, double _indent, double _endIndent, Color _color) {
    return Divider(
      color: _color,
      height: 0,
      thickness: _thickness,
      indent: _indent,
      endIndent: _endIndent,
    );
  }

  Widget logoContent() {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image(
          width: 100,
          image:
              AssetImage("lib/assets/images/alfa-corretora-crop-content.png"),
        ),
      ),
    );
  }
}
