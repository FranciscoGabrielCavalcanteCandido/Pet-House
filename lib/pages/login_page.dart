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
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.purple,
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: ListView(children: <Widget>[
          SizedBox(
            width: 150,
            height: 150,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "Nome de Usuário",
              labelStyle: TextStyle(
                color: Colors.black,
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
                color: Colors.black,
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
              child: Text('Entrar'),
              onPressed: () => {},
            ),
          ),
        ]),
      ),
    );
  }
}
