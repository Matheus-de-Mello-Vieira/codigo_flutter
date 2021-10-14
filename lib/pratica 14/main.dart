import 'package:aula/lista.dart';
import 'package:aula/tela.dart';
import 'package:flutter/material.dart';

void main() {
  Map<String, Widget Function(BuildContext)> rotas = {};

  for(int i = 0; i < telasInfo.length; i++){
    rotas['/${telasInfo[i]['rota']}'] = (_) => Tela(telasInfo[i]);
  }

  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: rotas,
      ),
    );
}