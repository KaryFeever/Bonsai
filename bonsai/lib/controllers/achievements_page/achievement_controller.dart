import 'package:bonsai/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../models/achievement.dart';
import '../../models/achievement_list.dart';
import '../../models/plants.dart';

class AchievementController extends ChangeNotifier {
  bool _viewAchieved = true;

  void switchView() {
    _viewAchieved = !_viewAchieved;
    notifyListeners();
  }

  bool getViewSetting() {
    return _viewAchieved;
  }

  List<Achievement> getListToView(Achievements achievements) {
    List<Achievement> toView = [];

    if (_viewAchieved) {
      for (Achievement achievement in achievements.getAll()) {
        if (achievement.getStatus()) toView.add(achievement);
      }
    } else
      toView = achievements.getAll();

    return toView;
  }

  void updatePlantsAchievements(Achievements achievements, Plants plants) {
    switch (plants.getPlants().length) {
      case 1:
        achievements.getAchievement(0).achievementUnlock();
        break;
      case 5:
        achievements.getAchievement(6).achievementUnlock();
        break;
      case 15:
        achievements.getAchievement(7).achievementUnlock();
        break;
    }
  }

  void updateWatering(Achievements achievements) {
    achievements.incrementWateringCounter();
    switch (achievements.getWateringCounter()) {
      case 1:
        achievements.getAchievement(1).achievementUnlock();
        break;
      case 5:
        achievements.getAchievement(9).achievementUnlock();
        break;
      case 15:
        achievements.getAchievement(10).achievementUnlock();
        break;
    }
  }

  void updateSpraying(Achievements achievements) {
    achievements.incrementSprayingCounter();
    if (achievements.getSprayingCounter() == 1) {
      achievements.getAchievement(2).achievementUnlock();
    }
  }

  void updateFertilizng(Achievements achievements) {
    achievements.incrementFertilizingCounter();
    if (achievements.getFertilizingCounter() == 1) {
      achievements.getAchievement(3).achievementUnlock();
    }
  }

  void unlockDescriptionAchievement(Achievements achievements) {
    achievements.getAchievement(4).achievementUnlock();
  }

  void unlockRenameAchievement(Achievements achievements) {
    achievements.getAchievement(5).achievementUnlock();
  }

  void unlockDeletedAchievement(Achievements achievements) {
    achievements.getAchievement(8).achievementUnlock();
  }

  
}
