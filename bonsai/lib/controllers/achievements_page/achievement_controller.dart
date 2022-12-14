/// Controller for the achievement page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:flutter/material.dart';
import 'package:bonsai/services/local_notification_service.dart';
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

  String getRank(Achievements achievements) {
    String rank = "";
    switch (achievements.getCountOfUnlocked()) {
      case 0:
      case 1:
      case 2:
        rank = "Beginner Gardener";
        break;
      case 3:
      case 4:
      case 5:
        rank = "Mid Gardener";
        break;
      case 6:
      case 7:
      case 8:
        rank = "Advanced Gardener";
        break;
      case 9:
      case 10:
      case 11:
        rank = "Eden Gardener";
        break;
      case 12:
        rank = "Groot";
        break;
    }

    return rank;
  }

  double getProgressBarCoeff(Achievements achievements) {
    double coeff = 0.1;
    switch (achievements.getCountOfUnlocked()) {
      case 1:
      case 4:
      case 7:
      case 10:
        coeff = 0.33;
        break;
      case 2:
      case 5:
      case 8:
      case 11:
        coeff = 0.66;
        break;
      case 0:
      case 3:
      case 6:
      case 9:
        coeff = 0.1;
        break;
      case 12:
        coeff = 1.0;
    }
    return coeff;
  }

  String leftToNextRank(Achievements achievements) {
    String remains = "";
    switch (achievements.getCountOfUnlocked()) {
      case 1:
      case 4:
      case 7:
      case 10:
        remains = 2.toString() + " achieves";
        break;
      case 2:
      case 5:
      case 8:
      case 11:
        remains = 1.toString() + " achieve";
        break;
      case 0:
      case 3:
      case 6:
      case 9:
        remains = 3.toString() + " achieves";
        break;
      case 12:
        remains = "";
    }

    return remains;
  }

  String nextRank(Achievements achievements) {
    String nextRank = "";
    switch (achievements.getCountOfUnlocked()) {
      case 0:
      case 1:
      case 2:
        nextRank = "Mid Gardener";
        break;
      case 3:
      case 4:
      case 5:
        nextRank = "Advanced Gardener";
        break;
      case 6:
      case 7:
      case 8:
        nextRank = "Eden Gardener";
        break;
      case 9:
      case 10:
      case 11:
        nextRank = "Groot";
        break;
      default:
        break;
    }

    return nextRank;
  }

  bool platinumEarned(Achievements achievements) {
    return achievements
        .getAchievement(achievements.getCountOfAchievements() - 1)
        .getStatus();
  }

  void updatePlantsAchievements(Achievements achievements, Plants plants) {
    switch (plants.getPlants().length) {
      case 1:
        if (achievements.getAchievement(0).getStatus()) return;
        achievements.getAchievement(0).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 0,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(0).getName() +
                "\" unlocked!");
        break;
      case 5:
        if (achievements.getAchievement(6).getStatus()) return;
        achievements.getAchievement(6).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 6,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(6).getName() +
                "\" unlocked!");
        break;
      case 15:
        if (achievements.getAchievement(7).getStatus()) return;
        achievements.getAchievement(7).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 7,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(7).getName() +
                "\" unlocked!");
        break;
    }
    this.unlockPlatinumTrophy(achievements);
  }

  void updateWatering(Achievements achievements) {
    achievements.incrementWateringCounter();
    switch (achievements.getWateringCounter()) {
      case 1:
        if (achievements.getAchievement(1).getStatus()) return;
        achievements.getAchievement(1).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 1,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(1).getName() +
                "\" unlocked!");
        break;
      case 5:
        if (achievements.getAchievement(9).getStatus()) return;
        achievements.getAchievement(9).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 9,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(9).getName() +
                "\" unlocked!");
        break;
      case 15:
        if (achievements.getAchievement(10).getStatus()) return;
        achievements.getAchievement(10).achievementUnlock();
        LocalNotificationService().showNotification(
            id: 10,
            title: "Bonsai",
            body: "Achievement \"" +
                achievements.getAchievement(10).getName() +
                "\" unlocked!");
        break;
    }
    this.unlockPlatinumTrophy(achievements);
  }

  void updateSpraying(Achievements achievements) {
    achievements.incrementSprayingCounter();
    if (achievements.getSprayingCounter() == 1) {
      if (achievements.getAchievement(2).getStatus()) return;
      achievements.getAchievement(2).achievementUnlock();
      LocalNotificationService().showNotification(
          id: 2,
          title: "Bonsai",
          body:
              "\"" + achievements.getAchievement(2).getName() + "\" unlocked!");
    }
    this.unlockPlatinumTrophy(achievements);
  }

  void updateFertilizng(Achievements achievements) {
    achievements.incrementFertilizingCounter();
    if (achievements.getFertilizingCounter() == 1) {
      if (achievements.getAchievement(3).getStatus()) return;
      achievements.getAchievement(3).achievementUnlock();
      LocalNotificationService().showNotification(
          id: 3,
          title: "Bonsai",
          body:
              "\"" + achievements.getAchievement(3).getName() + "\" unlocked!");
    }
    this.unlockPlatinumTrophy(achievements);
  }

  void unlockDescriptionAchievement(Achievements achievements) {
    if (achievements.getAchievement(4).getStatus()) return;
    achievements.getAchievement(4).achievementUnlock();
    LocalNotificationService().showNotification(
        id: 4,
        title: "Bonsai",
        body: "Achievement \"" +
            achievements.getAchievement(4).getName() +
            "\" unlocked!");
    this.unlockPlatinumTrophy(achievements);
  }

  void unlockRenameAchievement(Achievements achievements) {
    if (achievements.getAchievement(5).getStatus()) return;
    achievements.getAchievement(5).achievementUnlock();
    LocalNotificationService().showNotification(
        id: 5,
        title: "Bonsai",
        body: "Achievement \"" +
            achievements.getAchievement(5).getName() +
            "\" unlocked!");
    this.unlockPlatinumTrophy(achievements);
  }

  void unlockDeletedAchievement(Achievements achievements) {
    if (achievements.getAchievement(8).getStatus()) return;
    achievements.getAchievement(8).achievementUnlock();
    LocalNotificationService().showNotification(
        id: 8,
        title: "Bonsai",
        body: "Achievement \"" +
            achievements.getAchievement(8).getName() +
            "\" unlocked!");
    this.unlockPlatinumTrophy(achievements);
  }

  void unlockPlatinumTrophy(Achievements achievements) {
    if (achievements
        .getAchievement(achievements.getCountOfAchievements() - 1)
        .getStatus()) return;
    for (int i = 0; i < achievements.getCountOfAchievements() - 1; i++) {
      if (!achievements.getAchievement(i).getStatus()) return;
    }
    achievements
        .getAchievement(achievements.getCountOfAchievements() - 1)
        .achievementUnlock();
    LocalNotificationService().showNotification(
        id: 12,
        title: "Bonsai",
        body: "Achievement \"" +
            achievements
                .getAchievement(achievements.getCountOfAchievements() - 1)
                .getName() +
            "\" unlocked!");
  }
}
