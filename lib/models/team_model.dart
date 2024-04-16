import 'package:notinhas/models/pokedex_model.dart';

class TeamPokemon {
  List<PokemonViewModel> list = [];
  late String name;

  TeamPokemon(this.list, this.name);
}