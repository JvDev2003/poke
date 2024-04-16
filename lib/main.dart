import 'package:flutter/material.dart';
import 'package:notinhas/repositories/menuRepostories.dart';
import 'package:notinhas/repositories/teamsRepositories.dart';
import 'package:notinhas/views/list.dart';
import 'package:notinhas/views/pokedex.dart';
import 'package:notinhas/views/team.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TeamsRepositories()),
        ChangeNotifierProvider(create: (context) => MenuRepositorie()),
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) =>  Pokedex(),
        '/team': (_) => const Team(),
        '/list': (_) => ListTest(),
      },
    );
  }
}