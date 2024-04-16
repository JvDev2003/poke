import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/team_model.dart';


class TeamsRepositories extends ChangeNotifier {
  final List<TeamPokemon> _list = [];

  UnmodifiableListView<TeamPokemon> get lista => UnmodifiableListView(_list);

  addTeam(TeamPokemon team){
    _list.add(team);
    notifyListeners();
  }

  removeTeam(TeamPokemon team){
    _list.remove(team);
    notifyListeners();
  }
}