import 'dart:convert';
import 'package:notinhas/models/pokedex_model.dart';
import 'package:http/http.dart' as http;

class PokedexController {
  Future<List<PokemonViewModel>>fetchPokemons() async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'].map<PokemonViewModel>((pokemonData) {
        return PokemonViewModel(pokemonData['url'], pokemonData['name']);
      }).toList();
    } else {
      throw Exception('Erro na requisição');
    }
  }

  Future<PokemonDetails> fetchPokemonImage(String url) async {
  final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final frontDefault = data['sprites']['front_default'];
      return PokemonDetails(frontDefault);
    } else {
      throw Exception('Erro na requisição');
    }
  }
}