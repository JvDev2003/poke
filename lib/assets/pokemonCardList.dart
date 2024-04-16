import 'package:flutter/material.dart';
import 'package:notinhas/models/pokedex_model.dart';
import 'package:notinhas/controllers/pokedex_controller.dart';

class PokemonCardList extends StatefulWidget {
  final PokemonViewModel pokemon;
  final double height;
  final ValueChanged<bool> onSelectionChange;

  const PokemonCardList({super.key, required this.pokemon, this.height = 100, required this.onSelectionChange});

  @override
  _PokemonCardListState createState() => _PokemonCardListState();
}

class _PokemonCardListState extends State<PokemonCardList> {
  PokedexController poke = PokedexController();
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: Card(
        color: isSelected ? Colors.blue : null,
        child: InkWell(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
            widget.onSelectionChange(isSelected);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FutureBuilder<PokemonDetails>(
                future: poke.fetchPokemonImage(widget.pokemon.url),
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
              Text(
                widget.pokemon.nome,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
