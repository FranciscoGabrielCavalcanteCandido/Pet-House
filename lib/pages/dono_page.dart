import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/donoDAO.dart';

class DonoPage extends StatelessWidget {
  String? nome;
  int? telefone;
  String? cpf;
  String? cidade;
  String? bairro;

  DonoDAO donoDAO = DonoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Cadastro de Dono'),
        backgroundColor: Colors.black,
      ),
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
        child: ListView(
          children: <Widget>[
            TextFormField(
              onChanged: (value) => nome = value,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nome",
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
              onChanged: (value) => telefone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Telefone",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextFormField(
              onChanged: (value) => cpf = value,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "CPF",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            TextFormField(
              onChanged: (value) => cidade = value,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Cidade",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
            TextFormField(
              onChanged: (value) => bairro = value,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Bairro",
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
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  donoDAO.salvar(Dono(
                      nome: nome!,
                      telefone: telefone!,
                      cpf: cpf!,
                      cidade: cidade!,
                      bairro: bairro!));
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
