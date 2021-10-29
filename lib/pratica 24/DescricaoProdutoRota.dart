import 'package:flutter/material.dart';

import 'Produto.dart';
import 'AlterarProdutoRota.dart';

class DescricaoProdutoRota extends StatefulWidget {
  final Produto produto;
  final int indice;

  DescricaoProdutoRota(this.produto, this.indice);

  @override
  State<DescricaoProdutoRota> createState() => _DescricaoProdutoRotaState();
}

class _DescricaoProdutoRotaState extends State<DescricaoProdutoRota> {
  late Produto produto;

  @override
  void initState() {
    this.produto = this.widget.produto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produto'),
        leading: new IconButton(
          icon: new Icon(Icons.ac_unit),
          onPressed: () => Navigator.of(context).pop(this.produto),
        ),
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
                            MaterialPageRoute(
                                builder: (context) =>
                                    AlterarProdutoRota(this.produto)))
                        .then((produto) => this.setState(() {
                              this.produto = produto;
                            }));
                  },
                ),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                        color: Colors.purple[900],
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context, this.produto);
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
