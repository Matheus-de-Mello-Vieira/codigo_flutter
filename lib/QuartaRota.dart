import 'package:flutter/material.dart';

import 'Menu.dart';
import 'Produto.dart';

class QuartaRota extends StatefulWidget {
  final Produto produto;
  final int index;

  QuartaRota(this.produto, this.index);

  @override
  State<QuartaRota> createState() => _QuartaRotaState();
}

class _QuartaRotaState extends State<QuartaRota> {

  TextEditingController? nomeController;
  TextEditingController? descricaoController = TextEditingController();
  TextEditingController? precoController = TextEditingController();

  ItemMenu? itemSelecionado;
  List<DropdownMenuItem<ItemMenu>>? listaItensMenu;

  @override
  void initState() {
    listaItensMenu = Menu.getListaItens();
    itemSelecionado = listaItensMenu![this.widget.index].value;

    descricaoController = TextEditingController(text: widget.produto.descricao);
    nomeController = TextEditingController(text: widget.produto.nome);
    precoController = TextEditingController(text: widget.produto.preco.toStringAsFixed(2));

    super.initState();
  }

  alterarItemSelecionado(ItemMenu? itemSelecionado) {
    setState(() => this.itemSelecionado = itemSelecionado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar produto"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              value: itemSelecionado,
              items: listaItensMenu,
              onChanged: this.alterarItemSelecionado,
              icon: Icon(Icons.arrow_downward),
              isExpanded: true,
              iconSize: 24,
              elevation: 16,
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => nomeController!.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'nome',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => descricaoController!.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'descrição',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => precoController!.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'preço',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 50, 100, 50),
            child: ElevatedButton(
              child: Icon(Icons.add),
              onPressed: () {
                Produto produto = Produto(
                  url: this.widget.produto.url,
                  nome: nomeController!.text,
                  descricao: descricaoController!.text,
                  preco: double.parse(precoController!.text),
                );
                Navigator.pop(context, produto);
              },
            ),
          ),]
      ),
    );
  }
}