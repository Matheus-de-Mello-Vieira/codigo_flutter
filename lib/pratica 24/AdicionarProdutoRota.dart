import 'package:flutter/material.dart';

import 'ListaDeImagens.dart';
import 'Menu.dart';
import 'Produto.dart';

class AdicionarProdutoRota extends StatefulWidget {
  AdicionarProdutoRotaState createState() {
    return AdicionarProdutoRotaState();
  }
}

class AdicionarProdutoRotaState extends State<AdicionarProdutoRota> {
  Imagem? imagemSelecionada;
  late List<DropdownMenuItem<Imagem>> listaImagensMenu;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();

  @override
  void initState() {
    listaImagensMenu = Menu.getListaItens();
    imagemSelecionada = listaImagensMenu[0].value;
    super.initState();
  }

  alterarItemSelecionado(Imagem? itemSelecionado) {
    setState(() => this.imagemSelecionada = itemSelecionado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Produto'),
      ),
      body: ListView(
        shrinkWrap: true, //Ocupar apenas o espaço necessário.
        padding: new EdgeInsets.only(left: 25, right: 25),
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              value: this.imagemSelecionada,
              items: this.listaImagensMenu,
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
              controller: this.nomeController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.nomeController.clear(),
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
              controller: this.descricaoController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.descricaoController.clear(),
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
              controller: this.precoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => this.precoController.clear(),
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
                  imagem: this.imagemSelecionada!,
                  nome: this.nomeController.text,
                  descricao: this.descricaoController.text,
                  preco: double.parse(this.precoController.text),
                );
                Navigator.pop(context, produto);
              },
            ),
          ),
        ],
      ),
    );
  }
}
