import 'package:bonsai/models/achievement.dart';
import 'package:flutter/material.dart';

class Achievements extends ChangeNotifier {
  List<Achievement> _achievements = [
    Achievement("First seed", "Add first plant to your garden!",
        "assets/icons/first_seed.svg"),
    Achievement("First Drop", "Water your plant for the first time!",
        "assets/icons/watering_can.svg"),
    Achievement("God's Dew", "Spray your plant for the first time!",
        "assets/icons/spray.svg"),
    Achievement(
        "Gainers",
        "Pamper your plant with fertilizer for the first time, it'll really like it!",
        "assets/icons/fertilize.svg"),
    Achievement("This is my friend", "Set a discription for your plant!",
        "assets/icons/description.svg"),
    Achievement("Passport change", "Rename your plant!", "assets/icons/id.svg"),
    Achievement("Garden grows!", "Add 5 plants to your garden!",
        "assets/icons/garden.svg"),
    Achievement("Eden garden!", "Add 15 plants to your garden!",
        "assets/icons/big_garden.svg"),
    Achievement(
        "RIP, my friend...",
        "We're sorry about your plants' dead. Let us console you with this achievement",
        "assets/icons/grave.svg"),
    Achievement("Serial Gardener", "Water your plants for 5 times",
        "assets/icons/resp_gardener.svg"),
    Achievement("Supergardener", "Water your plants for 15 times",
        "assets/icons/garden_superhero.svg"),
    Achievement(
        "Platinum Trophy",
        "Congratulations! You've completed all of existing achievements at the moment. We're really thankful to you for using our application!",
        "assets/icons/platinum_trophy.svg")
  ];

  int _wateringCounter = 0;
  int _sprayingCounter = 0;
  int _fertilizingCounter = 0;

  void incrementWateringCounter() {
    _wateringCounter++;
  }

  void incrementSprayingCounter() {
    _sprayingCounter++;
  }

  void incrementFertilizingCounter() {
    _fertilizingCounter++;
  }

  int getWateringCounter() {
    return _wateringCounter;
  }

  int getSprayingCounter() {
    return _sprayingCounter;
  }

  int getFertilizingCounter() {
    return _fertilizingCounter;
  }

  Achievement getAchievement(int index) {
    return _achievements[index];
  }

  List<Achievement> getAll() {
    return _achievements;
  }

  int getCountOfUnlocked() {
    int countOfUnlocked = 0;
    for (Achievement achievement in _achievements) {
      if (achievement.getStatus()) countOfUnlocked++;
    }
    return countOfUnlocked;
  }

  int getCountOfAchievements() {
    int countOfAchievements = 0;
    for (Achievement achievement in _achievements) {
      countOfAchievements++;
    }
    return countOfAchievements;
  }
}
