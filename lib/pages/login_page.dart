import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 40, right: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.deepPurple,
            ],
            stops: [
              0.4,
              0.7,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: ListView(children: <Widget>[
          Image.asset("images/Pet_House-removebg-preview.png",
              width: 300, height: 200),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Nome de Usuário",
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            height: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange, shape: const StadiumBorder()),
              child: Text(
                'Entrar',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () =>
                  {Navigator.pushNamed(context, './paginaInicial')},
            ),
          ),
        ]),
      ),
    );
  }
}
