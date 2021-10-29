class Imagem {
  final String url, nome;

  const Imagem({required this.url, required this.nome});
}

const List<Imagem> listaDeImagem = const [
  Imagem(
    url: 'https://picsum.photos/250?image=9',
    nome: 'Notebook',
  ),
  Imagem(
    url:
        'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    nome: 'Bolo',
  ),
  Imagem(
    url:
        'https://images.pexels.com/photos/213798/pexels-photo-213798.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    nome: 'Torre e aerogerador',
  ),
];
