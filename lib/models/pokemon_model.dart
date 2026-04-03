class PokemonModel {
  final String nome;
  final String url;

  PokemonModel({required this.nome, required this.url});

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(nome: map['name'] ?? '', url: map['url'] ?? '');
  }

  int get id {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return int.parse(segments[segments.length - 2]);
  }

  String get imageUrl {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }
}
