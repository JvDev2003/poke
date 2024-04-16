import 'package:flutter/material.dart';
import 'package:notinhas/assets/barraNavegacao.dart';
import 'package:notinhas/assets/pokemonCardList.dart';
import 'package:notinhas/controllers/pokedex_controller.dart';
import 'package:notinhas/models/pokedex_model.dart';
import 'package:notinhas/repositories/menuRepostories.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ListTest extends StatefulWidget {
  late MenuRepositorie menu;

  ListTest({super.key});
  @override
  State<ListTest> createState() => _PokedexState();
}

class _PokedexState extends State<ListTest> {
  PokedexController poke = PokedexController();
  List<bool> selected = List.generate(20, (index) => false);

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
                    child: ListView.builder(
                      itemCount: pokemons!.length,
                      itemBuilder: (context, index) {
                        return PokemonCardList(
                          pokemon: pokemons[index],
                          onSelectionChange: (bool value) { },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Text('Nenhum dado encontrado.');
            }
          },
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          
        },
        child: const Icon(Icons.check),
      ),
      bottomNavigationBar: BottomNavigationMenu(
        currentIndex: menu.current,
        onTap: (int index) {
          menu.click(index, context);
        },
      ),
    );
  }
}
