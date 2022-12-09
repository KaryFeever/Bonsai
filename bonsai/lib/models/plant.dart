import 'package:bonsai/models/care_type.dart';
import 'package:flutter/material.dart';

class Plant {
  String _name = "";
  String _description = "";
  String _imagePath = "";
  // static Image _image = NULL;
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

  String getImagePath() {
    return _imagePath;
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
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
