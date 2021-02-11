import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _oneTap() {
    setState(() {
      isLoading = !isLoading;
      _onClickLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: _body(context),
        ),
      ),
    );
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Informe o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            logoContent(),
            textFormFieldLogin(),
            textFormFieldSenha(),
            changeButton()
          ],
        ));
  }

  Widget logoContent() {
    return Container(
        child: new Image.asset(
          "lib/assets/images/alfa-corretora.png",
          width: 300,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 75, bottom: 50));
  }

  Widget textFormFieldLogin() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
          controller: _tLogin,
          validator: _validateLogin,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Login",
              labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              hintText: "Informe seu e-mail")),
    );
  }

  Widget textFormFieldSenha() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TextFormField(
          controller: _tSenha,
          validator: _validateSenha,
          obscureText: true,
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              labelText: "Senha",
              labelStyle:
                  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              hintText: "Informe a senha")),
    );
  }

  Widget changeButton() {
    return isLoading ? circularButton() : defButton();
  }

  Widget defButton() {
    return Container(
      padding: EdgeInsets.only(top: 75),
      child: GestureDetector(
          onTap: _oneTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10)),
              width: 50,
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
    );
  }

  Widget circularButton() {
    return Container(
      padding: EdgeInsets.only(top: 75),
      child: GestureDetector(
        onTap: _oneTap,
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(40)),
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
            )),
      ),
    );
  }

  _onClickLogin(BuildContext context) {
    final login = _tLogin.text;
    final senha = _tSenha.text;
    print("Login: $login , Senha: $senha ");
    if (!_formKey.currentState.validate()) {
      return;
    }
    if (login.isEmpty || senha.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Erro"),
              content: Text("Login e/ou Senha inválido(s)"),
              actions: <Widget>[
                FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ]);
        },
      );
    }
  }
}
