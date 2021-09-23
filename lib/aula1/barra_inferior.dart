import 'package:flutter/material.dart';

class BarraInferior extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Usuário"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "Fotos"),
        BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: "Fotos")
      ],
    );
  }
}
