import 'package:flutter/material.dart';
import 'package:notinhas/assets/barraNavegacao.dart';
import 'package:notinhas/assets/pokemonCard.dart';
import 'package:notinhas/controllers/pokedex_controller.dart';
import 'package:notinhas/models/pokedex_model.dart';
import 'package:notinhas/repositories/menuRepostories.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class Pokedex extends StatefulWidget{
  late MenuRepositorie menu;
  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  PokedexController poke = PokedexController();
  @override
  Widget build(BuildContext context) {
    var menu = Provider.of<MenuRepositorie>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List<PokemonViewModel>>(
          future: poke.fetchPokemons(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final pokemons = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: pokemons!.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4/3
                      ),
                      itemBuilder: (context, index) {
                        return PokemonCard(pokemon: pokemons[index]);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Nenhum dado encontrado.');
            }
},
        )
      ),
      bottomNavigationBar: BottomNavigationMenu(
        currentIndex: menu.current,
         onTap: (int index){menu.click(index, context);},
      ),
    );
  }
}