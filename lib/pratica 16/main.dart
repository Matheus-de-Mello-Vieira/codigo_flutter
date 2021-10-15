import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

// O objeto da classe Preco será enviado para a segunda rota.
class Preco {
  double etanol;
  double gasolina;
  Preco(this.etanol, this.gasolina);

  double get razao => etanol / gasolina;
}

class PrimeiraRota extends StatefulWidget {
  @override
  State<PrimeiraRota> createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  final TextEditingController etanolController = TextEditingController();

  final TextEditingController gasolinaController = TextEditingController();

  String texto = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: etanolController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => etanolController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o valor do etanol',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: gasolinaController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => gasolinaController.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o valor da gasolina',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Preco preco = Preco(
                double.parse(etanolController.text),
                double.parse(gasolinaController.text),
              );
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SegundaRota(preco)))
                  .then((resposta) {
                setState(() {
                  texto = resposta;
                });
              });
            },
            child: Text('Ir para a Segunda Rota'),
          ),
          Text(
            texto,
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  final Preco preco;
  SegundaRota(this.preco);
  @override
  Widget build(BuildContext context) {
    String resposta = 'Abasteça com ${preco.razao > 1 ? 'Etanol' : 'Gasolina'}';
    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${preco.etanol.toStringAsFixed(2)} / ${preco.gasolina.toStringAsFixed(2)} = ${preco.razao.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              resposta,
              style: TextStyle(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, resposta);
              },
            ),
          ],
        ),
      ),
    );
  }
}
