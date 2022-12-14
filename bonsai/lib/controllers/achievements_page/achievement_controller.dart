import 'package:bonsai/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../models/achievement.dart';
import '../../models/achievement_list.dart';

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
}
