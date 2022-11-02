import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/sqlite/animalDAO.dart';

class AnimalList extends StatelessWidget {
  AnimalDAO animalDAO = AnimalDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Animais'),
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder(
        future: animalDAO.listar(),
        builder: (BuildContext context, AsyncSnapshot<List<Animal>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          var animais = dados.data!;
          return ListView.builder(
              itemCount: animais.length,
              itemBuilder: (context, index) {
                var animal = animais[index];

                return Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 4,
                      margin: const EdgeInsets.all(2),
                      child: ListTile(
                        title: Text(
                          animal.nome.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.pets),
                          onPressed: () => Navigator.pushNamed(
                                  context, './listaAnimal',
                                  arguments: animais)
                              .then((value) {}),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
