import 'package:flutter/material.dart';

class CampoTexto extends StatelessWidget {
  String rotulo;
  ValueChanged campo;
  TextInputType tipo;

  CampoTexto(
      {Key? key,
      required this.rotulo,
      required this.tipo,
      required this.campo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: tipo,
      onChanged: campo,
      decoration: InputDecoration(label: Text(rotulo)),
    );
  }
}
