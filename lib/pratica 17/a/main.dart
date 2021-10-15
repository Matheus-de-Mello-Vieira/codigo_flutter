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
    final TextEditingController celsiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Graus Fahrenheit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: celsiusController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Informe o a temperatura em Celsius',
              )),
          ElevatedButton(
            child: Text("Navegar para a Segunda Rota"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RotaGenerica.caminhoDaRota,
                arguments:
                    ArgumentosDaRota(double.parse(celsiusController.text)),
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
        ModalRoute.of(context)!.settings.arguments as ArgumentosDaRota;
    return Scaffold(
      appBar: AppBar(
        title: Text("Graus Fahrenheit"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Graus Celsius: ${argumentos.celsius.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          Text(
            'Graus Fahrenheit: ${(argumentos.celsius * 1.8 + 32).toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

class ArgumentosDaRota {
  double celsius;
  ArgumentosDaRota(this.celsius);
}
