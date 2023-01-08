/// Model for the plant
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/models/care_type.dart';
import 'package:bonsai/models/category.dart';

class Plant {
  String _name = "";
  String _description = "";
  String _imagePath = "";
  CareType _watering = CareType("Watering");
  CareType _spraying = CareType("Spraying");
  CareType _fertilizing = CareType("Fertilizing");
  Category _category = Category();

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

  void setCategory(Category category) {
    _category = category;
  }

  void removeCategory() {
    _category = Category();
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

  Category getPlantCategory() {
    return _category;
  }
}
