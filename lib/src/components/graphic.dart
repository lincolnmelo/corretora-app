import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart' as graphic;
import 'package:percent_indicator/percent_indicator.dart';

import 'data.dart';

class IntervalPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                child: Text('Rendimentos nos últimos 05 meses',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                padding: EdgeInsets.fromLTRB(0, 40, 0, 20.0),
              ),
              Container(
                width: 350,
                height: 300,
                child: graphic.Chart(
                  data: myData,
                  scales: {
                    'genre': graphic.CatScale(
                      accessor: (map) => map['genre'] as String,
                    ),
                    'sold': graphic.LinearScale(
                      accessor: (map) => map['sold'] as num,
                      nice: true,
                    )
                  },
                  coord: graphic.PolarCoord(),
                  geoms: [
                    graphic.IntervalGeom(
                      position: graphic.PositionAttr(field: 'genre*sold'),
                      color: graphic.ColorAttr(field: 'genre'),
                    )
                  ],
                  axes: {
                    'genre': graphic.Defaults.circularAxis,
                    'sold': graphic.Defaults.radialAxis..label = null,
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Janeiro',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2500,
                    percent: 0.85,
                    center: Text("85.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xFF1592ff)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Fevereiro',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 1000,
                    percent: 0.55,
                    center: Text("55.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xFF2ec25a)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Março',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: 0.65,
                    center: Text("65.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xFFfacc14)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Abril',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 1300,
                    percent: 0.75,
                    center: Text("75.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xFF223273)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text('Maio',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: new LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 50,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 900,
                    percent: 0.45,
                    center: Text("45.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Color(0xFF8441e0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
