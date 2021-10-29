import 'package:flutter/material.dart';

import 'Produto.dart';
import 'AdicionarProdutoRota.dart';
import 'DescricaoProdutoRota.dart';

class ListaProdutosRota extends StatefulWidget {
  @override
  ListaProdutosRotaState createState() => ListaProdutosRotaState();
}

class ListaProdutosRotaState extends State<ListaProdutosRota> {
  final List<Produto> produtos = <Produto>[];
  void adicionarProdutoNaLista(Produto produto) {
    setState(() => produtos.insert(0, produto));
  }

  void removerProdutoNaLista(int indice) {
    setState(() => this.produtos.removeAt(indice));
  }

  confirmarExclusao(BuildContext context, int indice) {
    Widget cancelamento = TextButton(
      child: Text("Cancelar"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget exclusao = TextButton(
      child: Text("Excluir"),
      onPressed: () {
        this.removerProdutoNaLista(indice);
        Navigator.of(context).pop();
      },
    );
    AlertDialog alerta = AlertDialog(
      title: Row(
        children: [
          Icon(Icons.add_alert),
          Text("Exclusão!"),
        ],
      ),
      content: Text("Deseja realmente excluir o produto?"),
      elevation: 25,
      actions: [
        cancelamento,
        exclusao,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
      ),
      body: ListView.builder(
        shrinkWrap: true, //Ocupar apenas o espaço necessário.
        padding: EdgeInsets.only(left: 25, top: 2.5, right: 25),
        itemCount: produtos.length,
        itemBuilder: (BuildContext context, int indice) {
          return Container(
            height: 80,
            margin: EdgeInsets.all(2),
            color: (indice % 2) == 0 ? Colors.blue[50] : Colors.grey[200],
            child: ListTile(
              leading: Image(
                image: NetworkImage(this.produtos[indice].url),
                height: 50,
                width: 70,
              ),
              title: Text('${this.produtos[indice].nome}'),
              subtitle: Text(
                'R\$ ${this.produtos[indice].preco.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.purple[900],
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DescricaoProdutoRota(this.produtos[indice], indice),
                  ),
                ).then((produto) {
                  if (produto != Null) {
                    this.setState(() {
                      this.produtos[indice] = produto;
                    });
                  }
                });
              },
              onLongPress: () {
                confirmarExclusao(context, indice);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AdicionarProdutoRota()),
          ).then(
            (novoProduto) {
              this.adicionarProdutoNaLista(novoProduto);
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[900],
      ),
    );
  }
}
