import 'package:aula/QuartaRota.dart';
import 'package:flutter/material.dart';

import 'Menu.dart';
import 'Produto.dart';

class SegundaRota extends StatefulWidget {
  SegundaRotaState createState() {
    return SegundaRotaState();
  }
}

class SegundaRotaState extends State<SegundaRota> {
  ItemMenu? itemSelecionado;
  List<DropdownMenuItem<ItemMenu>>? listaItensMenu;
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
/*O método initState() gera o estado inicial do widget
quando um objeto da classe for instanciado.*/
  @override
  void initState() {
    listaItensMenu = Menu.getListaItens();
    itemSelecionado = listaItensMenu![0].value;
    super.initState();
  }

  alterarItemSelecionado(ItemMenu? itemSelecionado) {
    setState(() => this.itemSelecionado = itemSelecionado);
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
              value: this.itemSelecionado,
              items: this.listaItensMenu,
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
                  url: this.itemSelecionado!.url,
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
