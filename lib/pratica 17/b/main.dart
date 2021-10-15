import 'package:flutter/material.dart';

void main() => runApp(MeuAplicativo());

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PrimeiraRota(),
      routes: {
        RotaGenerica.caminhoDaRota: (context) => RotaGenerica(),
      },
    );
  }
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController realController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Valor em Real"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: realController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Informe o valor em Real',
              )),
          ElevatedButton(
            child: Text("> Próximo"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RotaGenerica.caminhoDaRota,
                arguments:
                    ArgumentosDaRota(double.parse(realController.text), -1),
              );
            },
          )
        ],
      ),
    );
  }
}

class RotaGenerica extends StatelessWidget {
  static const caminhoDaRota = '/rotaGenerica';
  @override
  Widget build(BuildContext context) {
    ArgumentosDaRota argumentos =
        ModalRoute.of(context).settings.arguments as ArgumentosDaRota;

    if (argumentos.cotacao < 0) {
      final TextEditingController cotacaoController = TextEditingController();

      return Scaffold(
          appBar: AppBar(
            title: Text("Cotação"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: cotacaoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Informe o valor em Real',
                  )),
              ElevatedButton(
                child: Text("> Próximo"),
                onPressed: () {
                  argumentos.cotacao = double.parse(cotacaoController.text);
                  Navigator.pushNamed(
                    context,
                    RotaGenerica.caminhoDaRota,
                    arguments: argumentos,
                  );
                },
              )
            ],
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Graus Fahrenheit"),
      ),
      body: Center(
        child: 
          Text(
            'R\$: ${argumentos.reais.toStringAsFixed(2)} = US\$ ${(argumentos.reais / argumentos.cotacao).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.yellow,
            ),
          ),
      ),
    );
  }
}

class ArgumentosDaRota {
  double reais;
  double cotacao;
  ArgumentosDaRota(this.reais, this.cotacao);
}
