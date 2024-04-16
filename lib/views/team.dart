import 'package:flutter/material.dart';
import 'package:notinhas/assets/barraNavegacao.dart';
import 'package:notinhas/assets/teamContainer.dart';
import 'package:notinhas/repositories/menuRepostories.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Team extends StatelessWidget{

  const Team({super.key});


  @override
  Widget build(BuildContext context) {
    var menu = Provider.of<MenuRepositorie>(context);
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: TeamContainerAlternative(),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/list');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationMenu(
        currentIndex: menu.current,
         onTap: (int index){menu.click(index, context);},
      ),
    );
  }
}