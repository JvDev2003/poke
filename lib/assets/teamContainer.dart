import 'package:flutter/material.dart';

class TeamContainerAlternative extends StatelessWidget {
  const TeamContainerAlternative({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
            height: 300,
            child: Card(
            child: Column(
            children: [
              GridPokemon(),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                'time1',
                  textAlign: TextAlign.center
                ),
              )

            ],
          )
    )
  );
  }
}

class GridPokemon extends StatelessWidget {
  const GridPokemon({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        return Center(
          child: Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png'),
        );
      }),
    )
  );
  }
}