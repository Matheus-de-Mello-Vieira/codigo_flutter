import 'package:flutter/material.dart';

class PainelPontos extends StatelessWidget {
  final int? numeroPontos;
  final int? indice;

  PainelPontos({this.numeroPontos, this.indice});

  Widget bolinha(bool ativa) {
    final int valorNumerico = ativa ? 1 : 0;

    return Padding(
      padding: EdgeInsets.only(left: 3, right: 3),
      child: Container(
        height: 8 + valorNumerico * 3,
        width: 8 + valorNumerico * 3,
        decoration: BoxDecoration(
          color: ativa? Colors.amberAccent : Colors.white,
          borderRadius: BorderRadius.circular(4.0 + valorNumerico),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.3,
              blurRadius: 3,
            )
          ],
        ),
      ),
    );
  }


  List <Widget> gerarPainelPontos () => new List<Widget>.generate(numeroPontos!, (i) => bolinha(i == indice));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: this.gerarPainelPontos(),
      ),
    );
  }
}
