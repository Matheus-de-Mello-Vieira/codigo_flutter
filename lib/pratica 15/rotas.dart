import 'package:flutter/material.dart';

class PrimeiraRota extends StatefulWidget {
  @override
  _PrimeiraRotaState createState() => _PrimeiraRotaState();
}

class _PrimeiraRotaState extends State<PrimeiraRota> {
  double _primeiroNumero = 0;
  double _segundoNumero = 0;
  bool _primeiraVez = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text("Primeira rota")),
      body: Column(children: [
        _primeiraVez
            ? const Text("")
            : Text(
                "$_primeiroNumero + $_segundoNumero = ${_primeiroNumero + _segundoNumero}"),
        ElevatedButton(
            child: const Text("Ir para a segunda rota"),
            onPressed: () {
              Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SegundaRota()))
                  .then((resposta) {
                setState(() {
                  _primeiraVez = false;
                  _primeiroNumero = resposta[0];
                  _segundoNumero = resposta[1];
                });
              });
            })
      ]),
    ));
  }
}

class SegundaRota extends StatelessWidget {
  final TextEditingController primeiroNumeroController =
      TextEditingController();
  final TextEditingController segundoNumeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segunda Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: primeiroNumeroController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'informe o primeiro número',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                controller: segundoNumeroController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'informe o segundo número',
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Ir para a Primeira Rota'),
              onPressed: () {
                Navigator.pop(context, [
                  double.parse(primeiroNumeroController.text),
                  double.parse(segundoNumeroController.text)
                ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
