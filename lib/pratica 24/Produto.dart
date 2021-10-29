import 'ListaDeImagens.dart';

class Produto {
  Imagem imagem;
  String nome, descricao;

  double preco;
  Produto({
    required this.imagem,
    required this.nome,
    required this.descricao,
    required this.preco,
  });

  String get url {
    return imagem.url;
  }
}
