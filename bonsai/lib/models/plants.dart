import 'package:bonsai/models/plant.dart';
import 'package:flutter/material.dart';

class Plants extends ChangeNotifier {
  int _plants_counter = 0;

  List<Plant> _plants = [];

  Plant? getPlant(String plantName) {
    for (Plant plant in _plants) {
      if (plant.getName() == plantName) return plant;
    }
    return null;
  }

  int getPlantsCounter() {
    return _plants_counter;
  }

  void addPlant(
      String name,
      String description,
      int wateringFrequency,
      bool watering,
      int wateringFrequencyIndex,
      int wateringFrequencyTimeIndex,
      int sprayingFrequency,
      bool spraying,
      int sprayingFrequencyIndex,
      int sprayingFrequencyTimeIndex,
      int fertilizingFrequency,
      bool fertilizing,
      int fertilizingFrequencyIndex,
      int fertilizingFrequencyTimeIndex,
      String imagePath) {
    Plant plant = Plant();
    plant.setName(name);
    plant.setDescription(description);
    plant.setImagePath(imagePath);
    if (watering) {
      plant.getWatering().setEnabled(watering);
      plant.getWatering().setFrequency(wateringFrequency);
      plant.getWatering().setFrequencyIndex(wateringFrequencyIndex);
      plant.getWatering().setTimeIndex(wateringFrequencyTimeIndex);
    }
    if (spraying) {
      plant.getSpraying().setEnabled(spraying);
      plant.getSpraying().setFrequency(sprayingFrequency);
      plant.getSpraying().setFrequencyIndex(sprayingFrequencyIndex);
      plant.getSpraying().setTimeIndex(sprayingFrequencyTimeIndex);
    }
    if (fertilizing) {
      plant.getFertilizing().setEnabled(fertilizing);
      plant.getFertilizing().setFrequency(fertilizingFrequency);
      plant.getFertilizing().setFrequencyIndex(fertilizingFrequencyIndex);
      plant.getFertilizing().setTimeIndex(fertilizingFrequencyTimeIndex);
    }

    _plants.add(plant);
    _plants_counter++;
    notifyListeners();
  }

  void removePlant(String name) {
    for (Plant plant in _plants) {
      if (plant.getName() == name) {
        _plants.removeAt(_plants.indexOf(plant));
        _plants_counter--;
        notifyListeners();
        break;
      }
    }
  }

  List<Plant> getPlants() {
    return _plants;
  }
}
