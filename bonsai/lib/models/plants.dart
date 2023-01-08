/// Model for the Plants
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/models/category.dart';
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
      String imagePath,
      String categoryName,
      Categories categories) {
    Plant plant = Plant();
    plant.setName(name);
    plant.setDescription(description);
    plant.setImagePath(imagePath);

    if (categoryName != Styles.notSelected &&
        categories.getCategoriesCounter() != 0 &&
        categoryName != "") {
      Category category = categories.getCategory(categoryName)!;
      plant.setCategory(category);

      if (category.getWatering().getEnabled()) {
        plant.getWatering().setEnabled(true);
        plant.getWatering().setFrequency(category.getWatering().getFrequency());
        plant
            .getWatering()
            .setFrequencyIndex(category.getWatering().getFrequencyIndex());
        plant.getWatering().setTimeIndex(category.getWatering().getTimeIndex());
        plant.getWatering().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getWatering().updateNextCareTime();
      }

      if (category.getSpraying().getEnabled()) {
        plant.getSpraying().setEnabled(true);
        plant.getSpraying().setFrequency(category.getSpraying().getFrequency());
        plant
            .getSpraying()
            .setFrequencyIndex(category.getSpraying().getFrequencyIndex());
        plant.getSpraying().setTimeIndex(category.getSpraying().getTimeIndex());
        plant.getSpraying().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getSpraying().updateNextCareTime();
      }

      if (category.getFertilizing().getEnabled()) {
        plant.getFertilizing().setEnabled(true);
        plant
            .getFertilizing()
            .setFrequency(category.getFertilizing().getFrequency());
        plant
            .getFertilizing()
            .setFrequencyIndex(category.getFertilizing().getFrequencyIndex());
        plant
            .getFertilizing()
            .setTimeIndex(category.getFertilizing().getTimeIndex());
        plant.getFertilizing().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getFertilizing().updateNextCareTime();
      }
    } else {
      plant.setCategory(Category());
      if (watering) {
        plant.getWatering().setEnabled(watering);
        plant.getWatering().setFrequency(wateringFrequency);
        plant.getWatering().setFrequencyIndex(wateringFrequencyIndex);
        plant.getWatering().setTimeIndex(wateringFrequencyTimeIndex);
        plant.getWatering().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getWatering().updateNextCareTime();
      }
      if (spraying) {
        plant.getSpraying().setEnabled(spraying);
        plant.getSpraying().setFrequency(sprayingFrequency);
        plant.getSpraying().setFrequencyIndex(sprayingFrequencyIndex);
        plant.getSpraying().setTimeIndex(sprayingFrequencyTimeIndex);
        plant.getSpraying().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getSpraying().updateNextCareTime();
      }
      if (fertilizing) {
        plant.getFertilizing().setEnabled(fertilizing);
        plant.getFertilizing().setFrequency(fertilizingFrequency);
        plant.getFertilizing().setFrequencyIndex(fertilizingFrequencyIndex);
        plant.getFertilizing().setTimeIndex(fertilizingFrequencyTimeIndex);
        plant.getFertilizing().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
        plant.getFertilizing().updateNextCareTime();
      }
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
