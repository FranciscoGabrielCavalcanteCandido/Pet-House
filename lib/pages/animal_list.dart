import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/sqlite/animalDAO.dart';
import 'package:pet_house/pages/animal_page.dart';

class AnimalList extends StatefulWidget {
  @override
  State<AnimalList> createState() => _AnimalListState();
}

class _AnimalListState extends State<AnimalList> {
  AnimalDAO animalDAO = AnimalDAO();

  late Animal animal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Animais'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, './cadastroAnimal')
                      .then((value) {
                    setState(() {});
                  }),
              icon: Icon(Icons.add))
        ],
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
                        subtitle: Text(
                          '''Raça: ${animal.raca.toString()}''',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => AnimalDAO()
                                    .excluir(animal.id)
                                    .then((value) {
                                  setState(() {});
                                }),
                              ),
                              IconButton(
                                  onPressed: () => AnimalDAO()
                                          .consultar(animal.id)
                                          .then((value) {
                                        setState(() {});
                                      }),
                                  icon: Icon(Icons.edit)),
                            ],
                          ),
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
