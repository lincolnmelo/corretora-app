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
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 30, bottom: 10),
              child: Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Novidades para você',
                      style: TextStyle(fontSize: 25, color: Colors.grey)),
                ),
                Align(
                  alignment: Alignment.center,
                  child: IconButton(
                      icon: Icon(Icons.trending_up),
                      color: Colors.grey,
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/investimento');
                      }),
                ),
              ]),
            ),
            cardNotification(Color(0xFF5cd498), 'Conservador'),
            cardNotification(Color(0xFFf4cc64), 'Moderado'),
            cardNotification(Color(0xFFbe545d), 'Arrojado'),
            cardNotification(Color(0xFFf4cc64), 'Moderado'),
            cardNotification(Color(0xFFbe545d), 'Arrojado'),
            cardNotification(Color(0xFF5cd498), 'Conservador'),
            cardNotification(Color(0xFFf4cc64), 'Moderado'),
            cardNotification(Color(0xFFbe545d), 'Arrojado'),
            cardNotification(Color(0xFFbe545d), 'Arrojado'),
            cardNotification(Color(0xFFf4cc64), 'Moderado'),
            cardNotification(Color(0xFFbe545d), 'Arrojado'),
            cardNotification(Color(0xFF5cd498), 'Conservador'),
          ],
        ));
  }

  Widget cardNotification(Color _colorPerfil, String _perfil) {
    var _boxshadow = <BoxShadow>[
      BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(1.5, 1.5),
          blurRadius: 5.0)
    ];

    return Padding(
      padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 12),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: _boxshadow,
            border: Border.all(color: Colors.grey[200], width: 1)),
        child: Container(
          child:
              SingleChildScrollView(child: contentCard(_colorPerfil, _perfil)),
        ),
      ),
    );
  }

  Widget contentCard(Color _colorPerfil, String _perfil) {
    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 26,
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[500]),
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text('CDB - XPTO',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue[500]),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text('Renda Fixa',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _colorPerfil),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(_perfil,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Container(
            child: Container(
              child: Text('Taxas e condições imperdiveis, venha conferir.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[500])),
            ),
          ),
        )
      ]),
    );
  }
}
