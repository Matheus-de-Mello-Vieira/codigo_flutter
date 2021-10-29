import 'package:flutter/material.dart';

import 'Produto.dart';
import 'QuartaRota.dart';

class TerceiraRota extends StatelessWidget {
  final Produto produto;
  final int indice;

  TerceiraRota(this.produto, this.indice);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto'),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  '${this.produto.nome}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple[900],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Image(
                  image: NetworkImage(this.produto.url),
                  height: 250,
                  width: 250,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text('${this.produto.descricao}'),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'R\$ ${this.produto.preco.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: ElevatedButton(
              child: Text("Alterar"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuartaRota(this.produto, this.indice))
                );
              },
            ),
          ),
              ButtonBar(
                children: [
                  TextButton(
                    child: Text(
                      'Voltar para a Primeira Rota',
                      style: TextStyle(
                        color: Colors.purple[900],
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}