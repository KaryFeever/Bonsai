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

  // проверка на необходимость ухода за растением сегодня
  bool careTodayNeeded(Plant plant) {
    if (plant.getWatering().careNeeded() ||
        plant.getSpraying().careNeeded() ||
        plant.getFertilizing().careNeeded()) {
      return true;
    }
    return false;
  }

  // что нужно сделать сегодня
  String whatNeedToDoToday(Plant plant) {
    if (plant.getWatering().careNeeded()) {
      return "water";
    }
    if (plant.getSpraying().careNeeded()) {
      return "spray";
    }
    if (plant.getFertilizing().careNeeded()) {
      return "fertilize";
    }
    return "nothing"; // :D
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

  // что нужно сделать раньше всего
  String nextCare(Plant plant) {
    int? w = 99999; // костыли :D
    int? s = 99999;
    int? f = 99999;

    if (wateringEnabled(plant)) {
      w = plant.getWatering().getDaysUntilNextCare();
    }
    if (sprayingEnabled(plant)) {
      s = plant.getSpraying().getDaysUntilNextCare();
    }
    if (fertilizingEnabled(plant)) {
      f = plant.getFertilizing().getDaysUntilNextCare();
    }

    // // если ничего не нужно делать
    // if (w == null && s == null && f == null) {
    //   return "No plans";
    // }

    int min = w!;
    if (s! < min) {
      min = s;
    }
    if (f! < min) {
      min = f;
    }

    if (min == w) {
      return "water";
    } else if (min == s) {
      return "spray";
    } else if (min == f) {
      return "fertilize";
    }

    return "nothing"; // никогда не должно сюда попасть :D
  }

  // сколько дней до следующего ухода
  String nextCareDays(Plant plant) {
    String care = nextCare(plant);

    if (care == "water") {
      return wateringNextCareDays(plant);
    } else if (care == "spray") {
      return sprayingNextCareDays(plant);
    } else if (care == "fertilize") {
      return fertilizingNextCareDays(plant);
    }

    return "noting";
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

  // для кнопки "Ухаживать" на главной странице
  void doCare(Plant plant) {
    if (plant.getWatering().careNeeded()) {
      water(plant);
      return;
    }
    if (plant.getSpraying().careNeeded()) {
      spray(plant);
      return;
    }
    if (plant.getFertilizing().careNeeded()) {
      fertilize(plant);
      return;
    }
  }
}
