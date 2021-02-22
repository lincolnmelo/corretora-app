import 'dart:io';

import 'package:flutter/material.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          infoPerson(),
          divider(8, 0, Theme.of(context).accentColor),
          listView(),
          infoBottom()
        ],
      ),
    ));
  }

  Widget infoPerson() {
    return UserAccountsDrawerHeader(
        otherAccountsPictures: [
          IconButton(
              icon: Icon(Icons.chevron_left),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
        currentAccountPicture: Container(
            width: 200.0,
            height: 200.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage("lib/assets/images/avatar.png")))),
        accountName: Text("Teste"),
        accountEmail: Text("teste@alfa.com.br"));
  }

  Widget infoBottom() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          print("Teste");
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: Text(
                                    "Atenção",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor,
                                        fontSize: 20),
                                  ),
                                  content: Text("Deseja sair do App?"),
                                  actions: <Widget>[
                                    TextButton(
                                        child: Text(
                                          "Não",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    TextButton(
                                        child: Text(
                                          "Sim",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  Theme.of(context).accentColor,
                                              fontSize: 20),
                                        ),
                                        onPressed: () {
                                          exit(0);
                                        })
                                  ]);
                            },
                          );
                        },
                        splashColor: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Theme.of(context).accentColor,
                            ),
                            Text('Sair',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image(
                        width: 80,
                        image: AssetImage(
                            "lib/assets/images/alfa-corretora-crop-content.png"),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget listView() {
    var color = Colors.grey[600];
    return Column(
      children: [
        listTile(Icon(Icons.graphic_eq), Text("Home Dashboard"), '/home'),
        divider(0.5, 80, color),
        listTile(
            Icon(Icons.trending_up), Text("Investimento"), '/investimento'),
        divider(0.5, 80, color),
        listTile(
            Icon(Icons.account_circle), Text("Minha conta"), '/minhaconta'),
        divider(0.5, 80, color)
      ],
    );
  }

  Widget divider(double _thickness, double _endIndent, Color _color) {
    return Divider(
      color: _color,
      height: 0,
      thickness: _thickness,
      indent: 0,
      endIndent: _endIndent,
    );
  }

  Widget listTile(Icon incon, Text text, String route) {
    return InkWell(
      onTap: () {
        print("Click Navigation");
        Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
      splashColor: Theme.of(context).primaryColor,
      child: ListTile(
        leading: incon,
        title: text,
      ),
    );
  }
}
