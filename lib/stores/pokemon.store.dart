import 'package:mobx/mobx.dart';
import 'package:pokedex_flutter/models/pokemon.model.dart';
import 'package:pokedex_flutter/repositories/pokemon.repository.dart';

part "pokemon.store.g.dart";

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  final _repository = PokemonRepository();

  @observable
  ObservableList<PokemonModel> pokemons = ObservableList<PokemonModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> getPokemons() async {
    isLoading = true;

    final result = await _repository.getPokemons();
    pokemons.addAll(result);

    isLoading = false;
  }
}
