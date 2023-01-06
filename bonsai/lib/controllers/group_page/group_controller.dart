/// Controller for the achievement page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:flutter/material.dart';
import 'package:bonsai/services/local_notification_service.dart';
import 'package:bonsai/models/group.dart';

class GroupController extends ChangeNotifier {
  bool _viewAchieved = true;

  void switchView() {
    _viewAchieved = !_viewAchieved;
    notifyListeners();
  }
}
