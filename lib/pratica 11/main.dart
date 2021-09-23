import 'package:flutter/material.dart';

import 'pratica 11/../album.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
      ),
    );

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álbum"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: album
            .map((foto) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    child: Image.network(foto['imagem'] as String),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => descricao(foto)),
                      );
                    })))
            .toList(),
      ),
    );
  }
}

class descricao extends StatelessWidget {
  final Map<String, String> _info;

  descricao(this._info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this._info['tituloAppBar'] as String),
          backgroundColor: Colors.green,
        ),
        body: Column(children: [
          Text(
            this._info['titulo'] as String,
            style: TextStyle(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this._info['descricao'] as String,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat);
  }
}
