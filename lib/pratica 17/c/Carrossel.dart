import 'package:flutter/material.dart';

import 'Descricao.dart';
import 'PainelPontos.dart';
import 'lista.dart';

class Carrossel extends StatefulWidget {
  @override
  CarrosselState createState() => CarrosselState();
}

class CarrosselState extends State<Carrossel> {
  int indice = 0;

  void anterior() => setState(() => indice = (indice - 1) % imagens.length);

  void posterior() => setState(() => indice = (indice + 1) % imagens.length);

  InkWell imagem() => InkWell(
        child: Stack(
          children: [
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: DecorationImage(
                  image: AssetImage(imagens[indice]['arquivo']!),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            Positioned(
              top: 375,
              left: 25,
              right: 25,
              child: PainelPontos(
                numeroPontos: imagens.length,
                indice: indice,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            Descricao.caminho,
            arguments: imagens[indice],
          );
        },
      );

  Row cursor() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: Icon(Icons.arrow_left),
              onPressed: anterior,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(13),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: ElevatedButton(
              child: Icon(Icons.arrow_right),
              onPressed: posterior,
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(13),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrossel'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imagem(),
          cursor(),
        ],
      ),
    );
  }
}
