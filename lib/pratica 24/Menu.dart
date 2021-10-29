import 'package:flutter/material.dart';

import 'ListaDeImagens.dart';

class Menu {
  static List<DropdownMenuItem<Imagem>> getDropdownMenuItens(
      List<Imagem> imagens) {
    List<DropdownMenuItem<Imagem>> listaItensMenu = [];
    for (Imagem imagem in imagens) {
      listaItensMenu.add(
        DropdownMenuItem(
          value: imagem,
          child: Text(imagem.nome),
        ),
      );
    }
    return listaItensMenu;
  }

  static List<DropdownMenuItem<Imagem>> getListaItens() {
    return getDropdownMenuItens(listaDeImagem);
  }
}
