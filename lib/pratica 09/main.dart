import 'package:flutter/material.dart';

main() => runApp(_PaginaInicial());

class _PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<_PaginaInicial> {
  int _numeroVezes = 0;

  void _click() {
    setState(() {
      _numeroVezes++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("Página inicial")),
      body: Center(
          child: Text(
              "Número de vezes emq ue botão foi pressionando: $_numeroVezes.\nEsse número é um ${_numeroVezes % 2 == 0 ? 'par' : 'ímpar'}")),
      floatingActionButton:
          FloatingActionButton(onPressed: _click, child: Icon(Icons.add)),
    ));
  }
}
