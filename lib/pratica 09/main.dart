import 'package:flutter/material.dart';

main() => runApp(_paginaInicial());

class _paginaInicial extends StatefulWidget {
  @override
  _paginaInicialState createState() => _paginaInicialState();
}

class _paginaInicialState extends State<_paginaInicial> {
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
