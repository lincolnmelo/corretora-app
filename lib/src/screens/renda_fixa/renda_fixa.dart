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
          title: Text('Renda fixa'),
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
                  child: Text('Renda Fixa Bancária',
                      style: TextStyle(fontSize: 25, color: Colors.grey)),
                ),
              ]),
            ),
            cardRendaFixa(Color(0xFF5cd498), 'Conservador'),
            cardRendaFixa(Color(0xFFf4cc64), 'Moderado'),
            cardRendaFixa(Color(0xFFbe545d), 'Arrojado'),
            cardRendaFixa(Color(0xFFf4cc64), 'Moderado'),
            cardRendaFixa(Color(0xFFbe545d), 'Arrojado'),
            cardRendaFixa(Color(0xFF5cd498), 'Conservador'),
            cardRendaFixa(Color(0xFFf4cc64), 'Moderado'),
            cardRendaFixa(Color(0xFFbe545d), 'Arrojado'),
            cardRendaFixa(Color(0xFFbe545d), 'Arrojado'),
            cardRendaFixa(Color(0xFFf4cc64), 'Moderado'),
            cardRendaFixa(Color(0xFFbe545d), 'Arrojado'),
            cardRendaFixa(Color(0xFF5cd498), 'Conservador'),
          ],
        ));
  }

  Widget cardRendaFixa(Color _colorPerfil, String _perfil) {
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
        height: 200,
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
    var colorDivider = Colors.grey[600];

    return Container(
      child: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('CDB - XPTO',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold)),
                          Text('Banco Outro S.A',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
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
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              print('Clicou');
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.trending_up,
                                    color: Colors.blue,
                                  ),
                                  Text('Aplicar',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          )),
                    )
                  ],
                )),
          ),
        ),
        divider(0.5, 10, 10, colorDivider),
        Padding(
          padding: EdgeInsets.only(top: 20, right: 5, left: 5, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Rentabilidade',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('2.45% a.a.',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('IR/IOF',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('Regressivo',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Vencimento',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('01/09/2020',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Qtd. Disponível',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('100',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: Padding(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Amortização',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('No vencimento',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Juros',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('No vencimento',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Text('Aplicação Min.',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Theme.of(context).primaryColor)),
                          Text('R\$ 10.000,00',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ]),
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
}
