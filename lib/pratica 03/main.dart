import 'package:flutter/material.dart';

void main() {
  String nome = "Ana";
  String dia = "quinta-feira";
  runApp(Container(
    color: Colors.black,
    child: Center(
      child: RichText(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: "",
          style: TextStyle(fontFamily: 'Raleway'), //TextStyle.
          children: [
            TextSpan(
              text: 'Olá, ',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                backgroundColor: Colors.white,
              ),
            ),
            TextSpan(
              text: '$nome, ',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  backgroundColor: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            TextSpan(
              text: '!\n',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                backgroundColor: Colors.white,
              ),
            ),
            TextSpan(
              text: 'Hoje é $dia!\n',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                backgroundColor: Colors.yellow,
              ),
            ),
            TextSpan(
              text: 'Bom dia!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
                backgroundColor: Colors.white,
              ),
            ),
            TextSpan(
              text:
                  '\n\n\nHoje, você terá que escrever um aplicativo\nem Flutter. O aplicativo deve imprimir um\ntexto na tela. O texto possui trechos com\nestilos diferentes.',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            TextSpan(
              text: '\n\n\nBoa prática\n',
              style: TextStyle(color: Colors.purple, fontSize: 12),
            ),
            TextSpan(
              text: '=',
              style: TextStyle(color: Colors.green, fontSize: 12),
            ),
            TextSpan(
              text: 'D',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
            TextSpan(
              text: 'H',
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),
    ),
  ));
}
