/// Model for the plant
/// Author: Mikhailov Kirill (xmikha00)

import 'package:bonsai/models/plant.dart';
import 'package:bonsai/models/plants.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';

class Group extends ChangeNotifier {
  String _name = "";
  String _description = "";
  String _place = "";
  String _imagePath = "";

  List<Plant> _plantList = [];

  List<bool?> _potentialPlants = [];

  String getName() {
    return _name;
  }

  void setName(String name) {
    _name = name;
  }

  String getDescription() {
    return _description;
  }

  void setDescription(String description) {
    _description = description;
  }

  String getPlace() {
    return _place;
  }

  void setPlace(String place) {
    _place = place;
  }

  String getImagePath() {
    return _imagePath;
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  List<Plant> getPlantList() {
    return _plantList;
  }

  int getCountOfAttachedPlants() {
    return _plantList.length;
  }

  bool getPlantFromList(String name) {
    for (int i = 0; i < _plantList.length; i++) {
      if (_plantList[i].getName() == name) return true;
    }
    return false;
  }

  void removePlantFromGroup(String name) {
    for (Plant plant in _plantList) {
      if (plant.getName() == name) {
        _plantList.removeAt(_plantList.indexOf(plant));
        notifyListeners();
        break;
      }
    }
  }
}
