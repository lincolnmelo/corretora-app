import 'package:flutter/material.dart';
import 'package:corretora_app/src/components/input_text.dart';

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
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/home.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[logoContent(), _body(), changeButton()],
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
    return Container(
        child: new Image.asset(
          "lib/assets/images/alfa-corretora.png",
          width: 300,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 75, bottom: 50));
  }

  Widget textFormFieldLogin() {
    String message = 'Informe seu e-mail';
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextInput(
        controller: _tLogin,
        returnMessage: message,
        hintText: 'Informe o e-mail',
        labelText: 'Login',
        textMessage: message,
      ),
    );
  }

  Widget textFormFieldSenha() {
    String message = 'Informe sua senha';
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextInput(
        controller: _tSenha,
        returnMessage: message,
        hintText: 'Informe a senha',
        labelText: 'Senha',
        textMessage: message,
      ),
    );
  }

  Widget changeButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
      child: isLoading ? circularButton() : defButton(),
    );
  }

  Widget defButton() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: GestureDetector(
          onTap: _oneTap,
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 3.0),
                        blurRadius: 5.0)
                  ]),
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
    return new Container(
      padding: EdgeInsets.only(top: 20),
      width: 50,
      child: GestureDetector(
        onTap: _oneTap,
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(40)),
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
    if (login != 'teste' || senha != 'teste') {
      showDialog(
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
    }
  }
}
