import 'package:flutter/material.dart';

class ItemMenu {
  String url, nome;
  ItemMenu({
    required this.url,
    required this.nome,
  });
}

class Menu {
  static List<ItemMenu> getItens() {
    return [
      ItemMenu(
        url: 'https://picsum.photos/250?image=9',
        nome: 'Notebook',
      ),
      ItemMenu(
        url:
            'https://images.pexels.com/photos/213780/pexels-photo213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Bolo',
      ),
      ItemMenu(
        url:
            'https://images.pexels.com/photos/213798/pexels-photo213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        nome: 'Torre e aerogerador',
      ),
    ];
  }

static List<DropdownMenuItem<ItemMenu>> getDropdownMenuItens(List itens) {
    List<DropdownMenuItem<ItemMenu>> listaItensMenu = [];
    for (ItemMenu item in itens) {
      listaItensMenu.add(
        DropdownMenuItem(
          value: item,
          child: Text(item.nome),
        ),
      );
    }
    return listaItensMenu;
  }

  static List<DropdownMenuItem<ItemMenu>> getListaItens() {
    return getDropdownMenuItens(getItens());
  }
}