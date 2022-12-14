import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/plants.dart';
import 'package:flutter/material.dart';
import 'package:bonsai/models/plant.dart';

class HomeController extends ChangeNotifier {
  /// Check if the plant needs care today.
  bool careTodayPlantNeeded(Plant plant) {
    if (plant.getWatering().careNeeded() ||
        plant.getSpraying().careNeeded() ||
        plant.getFertilizing().careNeeded()) {
      return true;
    }
    return false;
  }

  /// Check if there is at least one plant that needs care today.
  bool careTodayPlantsNeeded(List<Plant> plants) {
    for (Plant plant in plants) {
      if (careTodayPlantNeeded(plant)) {
        return true;
      }
    }
    return false;
  }

  /// Count how many plants need care today.
  int counterPlantsToCareToday(List<Plant> plants) {
    int counter = 0;
    for (Plant plant in plants) {
      if (careTodayPlantNeeded(plant)) {
        counter++;
      }
    }
    return counter;
  }

  /// Checks what needs to be done today for the plant.
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

  int daysIn31Years = 365 * 31;

  /// Checks what needs to be done first for the plant.
  String nextCare(Plant plant) {
    int? w = daysIn31Years;
    int? s = daysIn31Years;
    int? f = daysIn31Years;

    if (PlantController().wateringEnabled(plant)) {
      w = plant.getWatering().getDaysUntilNextCare();
    }
    if (PlantController().sprayingEnabled(plant)) {
      s = plant.getSpraying().getDaysUntilNextCare();
    }
    if (PlantController().fertilizingEnabled(plant)) {
      f = plant.getFertilizing().getDaysUntilNextCare();
    }

    // Finds the nearest day of care.
    int min = w!;
    if (s! < min) {
      min = s;
    }
    if (f! < min) {
      min = f;
    }

    // Returns the type of care.
    if (min == w) {
      return "water";
    } else if (min == s) {
      return "spray";
    } else if (min == f) {
      return "fertilize";
    }

    return "nothing";
  }

  /// Returns the number of days until the next care.
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

  // Do care for the plant.
  void doCare(Plant plant, AchievementController controller,
      Achievements achievements) {
    if (plant.getWatering().careNeeded()) {
      PlantController().water(plant);
      controller.updateWatering(achievements);
      return;
    }
    if (plant.getSpraying().careNeeded()) {
      PlantController().spray(plant);
      controller.updateSpraying(achievements);
      return;
    }
    if (plant.getFertilizing().careNeeded()) {
      PlantController().fertilize(plant);
      controller.updateFertilizng(achievements);
      return;
    }
  }

  // Sorts plants by the need for care.
  List<Plant> getPlantsSortedByNextCare(List<Plant> plants) {
    List<Plant> sortedPlants = plants;

    String nextCareA;
    String nextCareB;
    int? daysA;
    int? daysB;

    sortedPlants.sort((a, b) {
      nextCareA = nextCare(a);
      nextCareB = nextCare(b);

      // Finds the number of days until the next care.
      if (nextCareA == "water") {
        daysA = a.getWatering().getDaysUntilNextCare();
      } else if (nextCareA == "spray") {
        daysA = a.getSpraying().getDaysUntilNextCare();
      } else if (nextCareA == "fertilize") {
        daysA = a.getFertilizing().getDaysUntilNextCare();
      }

      if (nextCareB == "water") {
        daysB = b.getWatering().getDaysUntilNextCare();
      } else if (nextCareB == "spray") {
        daysB = b.getSpraying().getDaysUntilNextCare();
      } else if (nextCareB == "fertilize") {
        daysB = b.getFertilizing().getDaysUntilNextCare();
      }

      if (daysA! < daysB!) {
        return -1;
      } else if (daysA! > daysB!) {
        return 1;
      } else {
        return 0;
      }
    });
    return sortedPlants;
  }
}
