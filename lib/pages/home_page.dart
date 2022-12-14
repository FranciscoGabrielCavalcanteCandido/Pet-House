import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Página Inicial'),
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
        child: ListView(children: <Widget>[
          Image.asset("images/Pet_House-removebg-preview.png",
              width: 250, height: 150),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, './listaAnimal'),
            label: Text(' Animais', style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange, shape: const StadiumBorder()),
            icon: const Icon(Icons.pets),
          ),
          Container(
            height: 20,
          ),
          SizedBox(
            width: 20,
          ),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, './listaDono'),
            label: Text('Dono', style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                primary: Colors.orange, shape: const StadiumBorder()),
            icon: const Icon(Icons.person),
          ),
          Container(
            height: 20,
          ),
          SizedBox(
            width: 20,
          ),
        ]),
      ),
    );
  }
}
