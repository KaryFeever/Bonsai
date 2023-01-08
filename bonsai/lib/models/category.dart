/// Model for category
/// Authors: Vladyslav Kovalets (xkoval21)

import 'package:bonsai/models/care_type.dart';

class Category {
  String _name = "";
  String _description = "";
  CareType _watering = CareType("Watering");
  CareType _spraying = CareType("Spraying");
  CareType _fertilizing = CareType("Fertilizing");

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

  CareType getWatering() {
    return _watering;
  }

  CareType getSpraying() {
    return _spraying;
  }

  CareType getFertilizing() {
    return _fertilizing;
  }
}
