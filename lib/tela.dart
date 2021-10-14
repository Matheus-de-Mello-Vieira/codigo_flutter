import 'package:flutter/material.dart';

import 'componente.dart';

class Tela extends StatelessWidget {
  final Map<String, Object> _info;

  Tela(this._info);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this._info['appTitle']}'),
      ),
      body: Center(
        child: Column(
          children: [
            Corpo(this._info['numero']),
            Botoes(this._info['anterior'],this._info['proximo']),
          ],
        ),
      ),
    );
  }
}