import 'package:bonsai/models/plant.dart';

class Plants {
  int _plants_counter = 0;

  List<Plant> _plants = [];

  Object getPlant(String plantName) {
    for (Plant plant in _plants) {
      if (plant.getName() == plantName) return plant;
    }
    return Null;
  }

  void addPlant(
      String name,
      String description,
      int wateringFrequency,
      bool watering,
      int sprayingFrequency,
      bool spraying,
      int fertilizingFrequency,
      bool fertilizing) {
    Plant plant = Plant();
    plant.setName(name);
    plant.setDescription(description);
    if (watering) {
      plant.getWatering().setEnabled(watering);
      plant.getWatering().setFrequency(wateringFrequency);
    }
    if (spraying) {
      plant.getSpraying().setEnabled(spraying);
      plant.getSpraying().setFrequency(sprayingFrequency);
    }
    if (fertilizing) {
      plant.getFertilizing().setEnabled(fertilizing);
      plant.getFertilizing().setFrequency(fertilizingFrequency);
    }

    _plants.add(plant);
    _plants_counter++;
  }

  void removePlant(String name) {
    for (Plant plant in _plants) {
      if (plant.getName() == name) {
        _plants.removeAt(_plants.indexOf(plant));
      }
    }
  }
}
