import 'package:flutter/material.dart';
import 'package:notinhas/models/pokedex_model.dart';
import 'package:notinhas/controllers/pokedex_controller.dart';
// ignore: must_be_immutable
class PokemonCard extends StatelessWidget {
  final PokemonViewModel pokemon;
  final double height;

  PokemonCard({super.key, required this.pokemon, this.height = 150});
  PokedexController poke = PokedexController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<PokemonDetails>(
              future: poke.fetchPokemonImage(pokemon.url),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final pokemons = snapshot.data;
                  return Image.network(pokemons!.urlImage);
                } else {
                  return const Text('Nenhum dado encontrado.');
                }
              },
            ),
            Text(pokemon.nome),
          ],
        ),
      ),
    );
  }
}