import 'package:flutter/material.dart';

import 'lista.dart';

class Corpo extends StatelessWidget {
  final String texto;
  Corpo(this.texto);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${this.texto}',
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
    );
  }
}

class Botoes extends StatelessWidget {
  final int _anterior, _proxima;
  Botoes(this._anterior, this._proxima);
  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    if(this._anterior != -1){
      children.add(ElevatedButton(
          child: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pushNamed(context, '/${telasInfo[this._anterior]['rota']}');
          },
        ));
    }

    children.add(ElevatedButton(
          child: Icon(Icons.navigate_next),
          onPressed: () {
            Navigator.pushNamed(context, '/${telasInfo[this._proxima]['rota']}');
          },
        ));

    return Row(
      mainAxisAlignment: this._anterior == -1 ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
      children: children,
    );
  }
}