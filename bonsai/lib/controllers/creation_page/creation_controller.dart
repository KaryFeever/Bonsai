/// Controller for the plant creation page
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import '../../models/plants.dart';

class CreationController extends ChangeNotifier {
  List<bool> _careFlags = [false, false, false];
  int _careFlagsChanged = 0;

  List<int> _careFrequencyInDays = [0, 0, 0];

  List _careFrequency = [
    [0, 0],
    [0, 0],
    [0, 0],
  ];

  int _plantCounter = 0;

  List _careFrequencyText = [
    "Every day",
    "Every day",
    "Every day",
  ];

  List<String> _time = const <String>[
    "Day",
    "Week",
    "Month",
    "Year",
  ];

  final _plantNameController = TextEditingController();

  final _plantDescriptionController = TextEditingController();

  String _imagePath = "";

  bool _submit = false;

  bool getSumbit() {
    return _submit;
  }

  int careChanged() {
    return _careFlagsChanged;
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  String getImagePath() {
    return _imagePath;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _plantNameController.dispose();
    _plantDescriptionController.dispose();
    super.dispose();
  }

  TextEditingController getPlantNameController() {
    return _plantNameController;
  }

  String? validateName() {
    if (_submit) {
      if (_plantNameController.text.isEmpty) {
        return 'Enter plant\'s name';
      }
      if (_plantNameController.text.length < 4) {
        return 'Too short';
      }
      if (_plantNameController.text.length > 12) {
        return 'Too long';
      }
    }
    return null;
  }

  String? validateDescription() {
    if ('\n'.allMatches(_plantDescriptionController.text).length >= 3) {
      return 'Only 3 rows are available';
    }
    if (_plantDescriptionController.text.length > 100) {
      return 'Too long';
    }
    return null;
  }

  bool validateCategory(String categoryName) {
    if (categoryName == Styles.notSelected) {
      return false;
    } else {
      return true;
    }
  }

  String validateCare(String categoryName) {
    if (((_careFlags[0] == false) &&
                (_careFlags[1] == false) &&
                (_careFlags[2] == false) ||
            validateCategory(categoryName) == true) &&
        _submit == true) {
      return "Select at least one type of care";
    }
    return "Type of care";
  }

  TextEditingController getPlantDescriptionController() {
    return _plantDescriptionController;
  }

  String getCareFrequencyText(int index) {
    return _careFrequencyText[index];
  }

  void updateCareFrequencyText(int index) {
    if (_careFrequency[index][0] + 1 == 1) {
      _careFrequencyText[index] = "Every " + _time[_careFrequency[index][1]];
    } else {
      _careFrequencyText[index] = "Every " +
          (_careFrequency[index][0] + 1).toString() +
          " " +
          _time[_careFrequency[index][1]] +
          "s";
    }
    notifyListeners();
  }

  int getFrequencyIndex(int index) {
    return _careFrequency[index][0];
  }

  void setFrequencyIndex(int index, int value) {
    _careFrequency[index][0] = value;
    notifyListeners();
  }

  int getTimeIndex(int index) {
    return _careFrequency[index][1];
  }

  void setTimeIndex(int index, int value) {
    _careFrequency[index][1] = value;
    notifyListeners();
  }

  int getTimeListLength() {
    return _time.length;
  }

  String getTimeItem(int index) {
    return _time[index];
  }

  void UpdateFlag(bool value, int index) {
    _careFlags[index] = value;
    _careFlagsChanged++;
    notifyListeners();
  }

  bool getFlag(int index) {
    return _careFlags[index];
  }

  void cancel() {
    _careFlags = [false, false, false];
    _careFrequency = [
      [0, 0],
      [0, 0],
      [0, 0],
    ];
    _careFrequencyText = [
      "Every day",
      "Every day",
      "Every day",
    ];
    _plantDescriptionController.clear();
    _plantNameController.clear();
    _careFrequencyInDays = [0, 0, 0];
    _imagePath = "";
    _submit = false;
  }

  void _transformCareFrequency() {
    for (int i = 0; i < 3; i++) {
      switch (_careFrequency[i][1]) {
        case 0:
          _careFrequencyInDays[i] = (_careFrequency[i][0] + 1);
          break;
        case 1:
          _careFrequencyInDays[i] = (_careFrequency[i][0] + 1) * 7;
          break;
        case 2:
          _careFrequencyInDays[i] = (_careFrequency[i][0] + 1) * 31;
          break;
        case 3:
          _careFrequencyInDays[i] = (_careFrequency[i][0] + 1) * 365;
          break;
      }
    }
  }

  void createPlant(
      Plants plants,
      BuildContext context,
      String categoryName,
      Categories categories,
      AchievementController controller,
      Achievements achievements) {
    _plantCounter++;
    _submit = true;
    if ((this.validateDescription() == null) &&
        (this.validateName() == null) &&
        (this.validateCare(categoryName) == "Type of care" ||
            validateCategory(categoryName) == true) &&
        (_imagePath != "")) {
      _transformCareFrequency();

      if (_plantDescriptionController.text != "") {
        controller.unlockDescriptionAchievement(achievements);
      }

      plants.addPlant(
        _plantNameController.text,
        _plantDescriptionController.text,
        _careFrequencyInDays[0],
        _careFlags[0],
        _careFrequency[0][0],
        _careFrequency[0][1],
        _careFrequencyInDays[1],
        _careFlags[1],
        _careFrequency[1][0],
        _careFrequency[1][1],
        _careFrequencyInDays[2],
        _careFlags[2],
        _careFrequency[2][0],
        _careFrequency[2][1],
        _imagePath,
        categoryName,
        categories,
      );
      cancel();
      Navigator.pop(context);
    }

    if (_careFlags[0]) {
      LocalNotificationService().showScheduledNotification(
          id: _plantCounter * 20,
          title: "Bonsai",
          body: _plantNameController.text + "requires watering",
          seconds: _careFrequencyInDays[0] * 86400);
    }
    if (_careFlags[1]) {
      LocalNotificationService().showScheduledNotification(
          id: _plantCounter * 21,
          title: "Bonsai",
          body: _plantNameController.text + "requires spraying",
          seconds: _careFrequencyInDays[1] * 86400);
    }
    if (_careFlags[2]) {
      LocalNotificationService().showScheduledNotification(
          id: _plantCounter * 22,
          title: "Bonsai",
          body: _plantNameController.text + "requires fertilizing",
          seconds: _careFrequencyInDays[2] * 86400);
    }

    notifyListeners();
  }
}
