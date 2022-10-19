import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text('Cadastro de Animal'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 200,
          left: 40,
          right: 40,
        ),
        
      ),
    );
  }
}
