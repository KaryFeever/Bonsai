/// Controller for the plant page
/// Author: Naumenko Maksim (xnaume01)
import 'package:flutter/material.dart';
import '../../models/plant.dart';

class PlantController extends ChangeNotifier {
  int _height = 260;
  int _changes = 0;

  int getChanged() {
    return _changes;
  }

  double getHeight(Plant plant) {
    bool w = plant.getWatering().getEnabled();
    bool s = plant.getSpraying().getEnabled();
    bool f = plant.getFertilizing().getEnabled();
    _height = 260;
    if (w) {
      _height += 70;
    }
    if (s) {
      _height += 70;
    }
    if (f) {
      _height += 70;
    }
    return _height.toDouble();
  }

  bool wateringEnabled(Plant plant) {
    return plant.getWatering().getEnabled();
  }

  bool sprayingEnabled(Plant plant) {
    return plant.getSpraying().getEnabled();
  }

  bool fertilizingEnabled(Plant plant) {
    return plant.getFertilizing().getEnabled();
  }

  bool wateringNeeded(Plant plant) {
    return plant.getWatering().careNeeded();
  }

  bool sprayingNeeded(Plant plant) {
    return plant.getSpraying().careNeeded();
  }

  bool fertilizingNeeded(Plant plant) {
    return plant.getFertilizing().careNeeded();
  }

  String wateringNextCareDays(Plant plant) {
    if (plant.getWatering().getDaysUntilNextCare() == 1) {
      return plant.getWatering().getDaysUntilNextCare().toString() + " day";
    }
    return plant.getWatering().getDaysUntilNextCare().toString() + " days";
  }

  String sprayingNextCareDays(Plant plant) {
    if (plant.getSpraying().getDaysUntilNextCare() == 1) {
      return plant.getSpraying().getDaysUntilNextCare().toString() + " day";
    }
    return plant.getSpraying().getDaysUntilNextCare().toString() + " days";
  }

  String fertilizingNextCareDays(Plant plant) {
    if (plant.getFertilizing().getDaysUntilNextCare() == 1) {
      return plant.getFertilizing().getDaysUntilNextCare().toString() + " day";
    }
    return plant.getFertilizing().getDaysUntilNextCare().toString() + " days";
  }

  void water(Plant plant) {
    plant.getWatering().setCareTime(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    plant.getWatering().updateNextCareTime();
    _changes++;
    notifyListeners();
  }

  void spray(Plant plant) {
    plant.getSpraying().setCareTime(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    plant.getSpraying().updateNextCareTime();
    _changes++;
    notifyListeners();
  }

  void fertilize(Plant plant) {
    plant.getFertilizing().setCareTime(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day));
    plant.getFertilizing().updateNextCareTime();
    _changes++;
    notifyListeners();
  }
}
