import 'package:aula/pratica%2013/lista.dart';
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