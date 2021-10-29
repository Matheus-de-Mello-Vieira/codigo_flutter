import 'package:flutter/material.dart';

import 'produtos.dart';

main() => runApp(
      MaterialApp(
        home: Inicio(),
        debugShowCheckedModeBanner: false,
      ),
    );

class Inicio extends StatefulWidget {
  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {
  int indice = 0;
  final List<Widget> rotas = [
    PrimeiraRota(),
    SegundaRota(),
  ];
  void aoPressionar(int indiceRotaSelecionada) {
    setState(
      () {
        this.indice = indiceRotaSelecionada;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: rotas[this.indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.indice,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Primeira Rota',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'Segunda Rota',
          ),
        ],
        onTap: (int indiceRotaEscolhida) {
          aoPressionar(indiceRotaEscolhida);
        },
      ),
    );
  }
}

class PrimeiraRota extends StatefulWidget {
  @override
  PrimeiraRotaState createState() => PrimeiraRotaState();
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );
    return Center(
      child: Text(
        'Primeira Rota',
        style: estilo,
      ),
    );
  }
}

class SegundaRota extends StatefulWidget {
  @override
  SegundaRotaState createState() => SegundaRotaState();
}

class SegundaRotaState extends State<SegundaRota> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(40),
          child: Center(
            child: Text(
              'Galeria',
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ...produtos.map((produto) => Cartao(produto))
      ],
    );
  }
}

class Info extends StatelessWidget {
  final Map<String, String> dados;
  final bool quebraLinha;

  Info(this.dados, this.quebraLinha);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(4),
        child: Image(
          image: NetworkImage(dados['url']!),
          height: 200,
          width: 400,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          dados['titulo']!,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          dados['descricao'] as String,
          maxLines: quebraLinha ? 100 : 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(4),
        child: Text(
          'R\$ ${dados['preco']!}',
          style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
      )
    ]);
  }
}

class Cartao extends StatelessWidget {
  final Map<String, String> _dados;

  Cartao(this._dados);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      margin: EdgeInsets.fromLTRB(30, 5, 30, 15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Info(this._dados, false),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TextButton(
                  child: Text('DETALHES'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Descricao(this._dados)),
                    );
                  },
                ),
                TextButton(
                  child: Text('COMPRAR'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Compra()),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Descricao extends StatelessWidget {
  final Map<String, String> _dados;

  Descricao(this._dados);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Info(this._dados, true),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: Text('Voltar para a Segunda Rota'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Compra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Página de Compra",
          style: TextStyle(
              color: Colors.purple,
              fontSize: 30,
              decoration: TextDecoration.none),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Voltar para a Segunda Rota'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ],
    );
  }
}
