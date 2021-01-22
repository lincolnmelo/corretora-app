import "package:flutter/material.dart";

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        child: Padding(
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
            containerButton(context)
          ],
        ));
  }

  Container logoContent() {
    return Container(
        child: new Image.asset(
          "lib/assets/images/alfaFinanceira.png",
          width: 200,
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 50));
  }

  Container textFormFieldLogin() {
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

  Container textFormFieldSenha() {
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

  Container containerButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      child: RawMaterialButton(
        fillColor: const Color(0xFFc29109),
        splashColor: Theme.of(context).primaryColor,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Icon(
                Icons.login,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Login",
                maxLines: 1,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onPressed: () {
          _onClickLogin(context);
        },
        shape: const StadiumBorder(),
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
