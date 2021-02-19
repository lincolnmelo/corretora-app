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
        children: <Widget>[infoPerson(), divider(), infoBottom()],
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
            height: 50,
            width: 80,
            padding: EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(
                    "lib/assets/images/alfa-corretora-crop-content.png"),
              ),
            )),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Theme.of(context).accentColor,
      height: 0,
      thickness: 8,
      indent: 0,
      endIndent: 0,
    );
  }
}
