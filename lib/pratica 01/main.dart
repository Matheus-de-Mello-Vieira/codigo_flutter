import 'package:flutter/material.dart';

import 'barra_inferior.dart';

class TextoPersonalizado extends StatelessWidget {
  final String titulo;

  TextoPersonalizado([this.titulo = "Texto personalizado 2"]);

  @override
  Widget build(BuildContext context) {
    return Text(titulo,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.blue,
        ));
  }
}

class CardPersonalizado extends StatelessWidget {
  final String _title;
  final String _subtitle;

  CardPersonalizado(this._title, this._subtitle);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.adb_outlined),
        title: Text(_title),
        subtitle: Text(_subtitle),
        trailing: Icon(Icons.auto_delete),
      ),
    );
  }
}

class Corpo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextoPersonalizado("texto1"),
        TextoPersonalizado("texto2"),
        TextoPersonalizado("texto3"),
        Text("Linha1"),
        FlutterLogo(),
      ],
    );
  }
}

class CorpoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        CardPersonalizado("aa", "bb"),
        Card(
          child: ListTile(title: Text("Linha 1")),
        ),
        ListTile(title: Text("Linha 2"), tileColor: Colors.red)
      ],
    );
  }
}

main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("Exemplo da utilização do scafford")),
    body: CorpoLista(),
    floatingActionButton:
        FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
    bottomNavigationBar: BarraInferior(),
  )));
}
