import 'dart:async';
import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/input_text.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool starting = false;
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      _onClickLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[logoContent(), _body(), loginButton()],
            ),
          ),
        ),
      ),
    );
  }

  _body() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            textFormFieldLogin(),
            textFormFieldSenha(),
          ],
        ));
  }

  Widget logoContent() {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: isLoading ? 250 : MediaQuery.of(context).size.width,
        transform: isLoading
            ? Matrix4.translationValues(
                0.0, MediaQuery.of(context).size.height / 6, 0.0)
            : Matrix4.translationValues(0.0, 0.0, 0.0),
        child: new Image.asset(
          "lib/assets/images/alfa-corretora.png",
          width: 300,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 100, bottom: 50));
  }

  Widget textFormFieldLogin() {
    String message = 'Informe seu e-mail';
    return _inputAnimation(
        TextInput(
          obscuringCharacter: false,
          controller: _tLogin,
          returnMessage: message,
          hintText: 'Informe o e-mail',
          labelText: 'Login',
          textMessage: message,
        ),
        MediaQuery.of(context).size.width);
  }

  Widget textFormFieldSenha() {
    String message = 'Informe sua senha';
    return _inputAnimation(
        TextInput(
          obscuringCharacter: true,
          controller: _tSenha,
          returnMessage: message,
          hintText: 'Informe a senha',
          labelText: 'Senha',
          textMessage: message,
        ),
        -MediaQuery.of(context).size.width);
  }

  _inputAnimation(Widget container, double direction) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
        transform: isLoading
            ? Matrix4.translationValues(direction, 0.0, 0.0)
            : Matrix4.translationValues(0.0, 0.0, 0.0),
        padding: EdgeInsets.all(20.0),
        child: container);
  }

  Widget loginButton() {
    var _boxshadow = <BoxShadow>[
      BoxShadow(
          color: Colors.black.withOpacity(0.5),
          offset: Offset(2.0, 3.0),
          blurRadius: 5.0)
    ];

    return new Container(
      padding: EdgeInsets.only(top: 50, left: 20, right: 20),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: isLoading ? 50 : MediaQuery.of(context).size.width,
        transform: isLoading
            ? Matrix4.translationValues(
                0.0, -MediaQuery.of(context).size.height / 6, 0.0)
            : Matrix4.translationValues(0.0, 0.0, 0.0),
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
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ))),
      ),
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print("Login: $login , Senha: $senha ");
    if (!_formKey.currentState.validate()) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    if (login != 'teste' || senha != 'teste') {
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
              content: Text("Login e/ou Senha inválido(s)."),
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
          Duration(seconds: 4),
          () => setState(() {
                isLoading = false;
                Navigator.pushNamed(context, '/login/token');
              }));
    }
  }

  _setState() {
    setState(() {
      starting = false;
    });
  }
}
