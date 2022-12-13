import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/plants.dart';
import 'package:flutter/material.dart';
import 'package:bonsai/models/plant.dart';

class HomeController extends ChangeNotifier {
  bool careTodayPlantsNeeded(List<Plant> plants) {
    for (Plant plant in plants) {
      if (careTodayPlantNeeded(plant)) {
        return true;
      }
    }
    return false;
  }

  // проверка на необходимость ухода за растением сегодня
  bool careTodayPlantNeeded(Plant plant) {
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

  // что нужно сделать раньше всего
  String nextCare(Plant plant) {
    int? w = 99999; // костыли :D
    int? s = 99999;
    int? f = 99999;

    if (PlantController().wateringEnabled(plant)) {
      w = plant.getWatering().getDaysUntilNextCare();
    }
    if (PlantController().sprayingEnabled(plant)) {
      s = plant.getSpraying().getDaysUntilNextCare();
    }
    if (PlantController().fertilizingEnabled(plant)) {
      f = plant.getFertilizing().getDaysUntilNextCare();
    }

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
      return PlantController().wateringNextCareDays(plant);
    } else if (care == "spray") {
      return PlantController().sprayingNextCareDays(plant);
    } else if (care == "fertilize") {
      return PlantController().fertilizingNextCareDays(plant);
    }

    return "noting";
  }

  // для кнопки "Ухаживать" на главной странице
  void doCare(Plant plant) {
    if (plant.getWatering().careNeeded()) {
      PlantController().water(plant);
      return;
    }
    if (plant.getSpraying().careNeeded()) {
      PlantController().spray(plant);
      return;
    }
    if (plant.getFertilizing().careNeeded()) {
      PlantController().fertilize(plant);
      return;
    }
  }

  // сортировка растений по необходимости ухода
  List<Plant> getPlantsSortedByNextCare(List<Plant> plants) {
    List<Plant> sorted_plants = plants;

    String a_next_care;
    String b_next_care;
    int? a_days;
    int? b_days;

    sorted_plants.sort((a, b) {
      a_next_care = nextCare(a);
      b_next_care = nextCare(b);

      if (a_next_care == "water") {
        a_days = a.getWatering().getDaysUntilNextCare();
      } else if (a_next_care == "spray") {
        a_days = a.getSpraying().getDaysUntilNextCare();
      } else if (a_next_care == "fertilize") {
        a_days = a.getFertilizing().getDaysUntilNextCare();
      }

      if (b_next_care == "water") {
        b_days = b.getWatering().getDaysUntilNextCare();
      } else if (b_next_care == "spray") {
        b_days = b.getSpraying().getDaysUntilNextCare();
      } else if (b_next_care == "fertilize") {
        b_days = b.getFertilizing().getDaysUntilNextCare();
      }

      if (a_days! < b_days!) {
        return -1;
      } else if (a_days! > b_days!) {
        return 1;
      } else {
        return 0;
      }
    });
    return sorted_plants;
  }
}
