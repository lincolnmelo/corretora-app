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
