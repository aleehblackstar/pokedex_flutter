import 'package:dio/dio.dart';
import 'package:pokedex_flutter/models/pokemon_model.dart';

class PokemonRepository {
  // instância do Dio com a URL base da API
  final _dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"));

  Future<List<PokemonModel>> getPokemons({
    int limit = 20,
    int offset = 0,
  }) async {
    final response = await _dio.get(
      "pokemon",
      queryParameters: {"limit": limit, "offset": offset},
    );

    final list = response.data['results'] as List;

    return list.map((item) => PokemonModel.fromMap(item)).toList();
  }
}
