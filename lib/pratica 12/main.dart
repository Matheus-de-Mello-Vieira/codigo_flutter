import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      "/": (_) => Pagina("/segunda", 1),
      "/segunda": (_) => Pagina("/terceira", 2),
      "/terceira": (_) => Pagina("/quarta", 3),
      "/quarta": (_) => Pagina("/", 4)
    }));

class Pagina extends StatelessWidget {
  final String seguinte;
  final int numero;

  Pagina(this.seguinte, this.numero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Página ${this.numero}")),
        body: Center(
            child: Column(children: [
          Container(
            child: Text(
              this.numero.toString(),
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            padding: EdgeInsets.all(40),
            margin: EdgeInsets.all(25),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ElevatedButton(
                child: Icon(Icons.navigate_before),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ElevatedButton(
                child: Icon(Icons.navigate_next),
                onPressed: () {
                  Navigator.pushNamed(context, seguinte);
                })
          ])
        ])));
  }
}
