import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_house/banco/entidades/animal.dart';
import 'package:pet_house/banco/entidades/dono.dart';
import 'package:pet_house/banco/sqlite/donoDAO.dart';

class DonoList extends StatefulWidget {
  @override
  State<DonoList> createState() => _DonoListState();
}

class _DonoListState extends State<DonoList> {
  DonoDAO donoDAO = DonoDAO();

  late Animal animal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Donos'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, './cadastroDono').then((value) {
                    setState(() {});
                  }),
              icon: Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: donoDAO.listar(),
        builder: (BuildContext context, AsyncSnapshot<List<Dono>> dados) {
          if (!dados.hasData) {
            return const CircularProgressIndicator();
          }
          var donos = dados.data!;
          return ListView.builder(
              itemCount: donos.length,
              itemBuilder: (context, index) {
                var dono = donos[index];

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
                          dono.nome.toString(),
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        subtitle: Text(
                          '''Cidade: ${dono.cidade.toString()}''',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () =>
                                    DonoDAO().excluir(dono.id).then((value) {
                                  setState(() {});
                                }),
                              ),
                              IconButton(
                                  onPressed: () => DonoDAO()
                                          .consultar(dono.id)
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
