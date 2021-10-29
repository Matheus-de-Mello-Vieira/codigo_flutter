import 'package:flutter/material.dart';

import 'ListaDeImagens.dart';
import 'Menu.dart';
import 'Produto.dart';

class AlterarProdutoRota extends StatefulWidget {
  final Produto produto;

  AlterarProdutoRota(this.produto);

  @override
  State<AlterarProdutoRota> createState() => _AlterarProdutoRotaState();
}

class _AlterarProdutoRotaState extends State<AlterarProdutoRota> {
  late final TextEditingController nomeController;
  late final TextEditingController descricaoController;
  late final TextEditingController precoController;

  late List<DropdownMenuItem<Imagem>> listaImagensMenu;
  late Imagem imagemSelecionada;

  @override
  void initState() {
    listaImagensMenu = Menu.getListaItens();
    imagemSelecionada = widget.produto.imagem;

    descricaoController = TextEditingController(text: widget.produto.descricao);
    nomeController = TextEditingController(text: widget.produto.nome);
    precoController =
        TextEditingController(text: widget.produto.preco.toStringAsFixed(2));

    super.initState();
  }

  alterarItemSelecionado(Imagem? itemSelecionado) {
    setState(() => imagemSelecionada = itemSelecionado!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar produto"),
        leading: new IconButton(
          icon: new Icon(Icons.ac_unit),
          onPressed: () => Navigator.of(context).pop(this.widget.produto),
        )
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: DropdownButton(
            value: imagemSelecionada,
            items: listaImagensMenu,
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
                onPressed: () => nomeController.clear(),
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
                onPressed: () => descricaoController.clear(),
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
                onPressed: () => precoController.clear(),
                icon: Icon(Icons.clear),
              ),
              border: OutlineInputBorder(),
              labelText: 'preço',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            child: Text("Salvar"),
            onPressed: () {
              Produto produto = Produto(
                imagem: imagemSelecionada,
                nome: nomeController.text,
                descricao: descricaoController.text,
                preco: double.parse(precoController.text),
              );
              Navigator.pop(context, produto);
            },
          ),
        ),
      ]),
    );
  }
}
