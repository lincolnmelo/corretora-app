import 'dart:async';

import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/input_text.dart';

class TokenPage extends StatefulWidget {
  @override
  _TokenPageState createState() => _TokenPageState();
}

class _TokenPageState extends State<TokenPage> {
  final _tToken = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool starting = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      starting = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => _setState());
  }

  _oneTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      isLoading = !isLoading;
      _onClickToken(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: starting ? 0.0 : 1.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  textLogin(),
                  divider(),
                  textSMS(),
                  _formToken(),
                  rToken(),
                  textAtendimento(),
                  loginButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _formToken() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            textFormFieldToken(),
          ],
        ));
  }

  Widget textLogin() {
    return Container(
      child: Text(
        'Autenticação de dois fatores',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontSize: 30),
      ),
    );
  }

  Widget textSMS() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        'Digite o código de 6 digitos enviado para o seu celular (11) *****-**00 via SMS',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 18),
      ),
    );
  }

  Widget textAtendimento() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text(
        'Caso não utilize mais esse número, entre em contato com a nossa central de atendimento.',
        textAlign: TextAlign.left,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.grey[700], fontSize: 12),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Theme.of(context).accentColor,
      height: 40,
      thickness: 5,
      indent: 0,
      endIndent: MediaQuery.of(context).size.width / 2,
    );
  }

  Widget textFormFieldToken() {
    String message = 'Obrigatório';
    return TextInput(
      obscuringCharacter: false,
      controller: _tToken,
      returnMessage: message,
      hintText: 'Informe o token',
      labelText: '',
      textMessage: message,
    );
  }

  Widget loginButton() {
    var _boxshadow = <BoxShadow>[
      BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(2.0, 3.0),
          blurRadius: 5.0)
    ];

    return new Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 6, left: 20, right: 20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: isLoading ? 50 : MediaQuery.of(context).size.width,
        child: InkWell(
            onTap: _oneTap,
            child: isLoading
                ? Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _boxshadow),
                    height: 50,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)),
                    ))
                : Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: _boxshadow),
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      'Continuar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ))),
      ),
    );
  }

  _onClickToken(BuildContext context) {
    final token = _tToken.text;
    print("Token: $token");
    if (!_formKey.currentState.validate()) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    if (token != '123456') {
      setState(() {
        isLoading = false;
      });
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
              content: Text(
                  "Token inválido, informe o token enviado para o seu celular."),
              actions: <Widget>[
                TextButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    } else {
      setState(() {
        isLoading = true;
      });
      FocusScope.of(context).unfocus();
      Timer(
          Duration(seconds: 3),
          () => setState(() {
                isLoading = false;
                Navigator.pushNamed(context, '/home');
              }));
    }
  }

  Widget rToken() {
    return InkWell(
      onTap: () => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                "Sucesso",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green[600],
                    fontSize: 20),
              ),
              content: Text(
                  "Código reenviado, verifique seu celular e tente novamente."),
              actions: <Widget>[
                TextButton(
                    child: Text(
                      "OK",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                          fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = false;
                      });
                      Navigator.pop(context);
                    })
              ]);
        },
      ),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Reenviar Código',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
              fontSize: 15),
        ),
      ),
    );
  }

  _setState() {
    Timer(
        Duration(milliseconds: 100),
        () => setState(() {
              starting = false;
            }));
  }
}
