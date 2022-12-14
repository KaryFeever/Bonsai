import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:flutter/material.dart';

import '../../models/plant.dart';
import '../../models/plants.dart';

class EditController extends ChangeNotifier {
  int _changed = 0;
  int _careFlagsChanged = 0;

  final _plantNameController = TextEditingController();

  final _plantDescriptionController = TextEditingController();

  String _imagePath = "";

  List<String> _time = const <String>[
    "Day",
    "Week",
    "Month",
    "Year",
  ];

  List _careFrequencyText = [
    "Every day",
    "Every day",
    "Every day",
  ];

  List _careFrequency = [
    [0, 0],
    [0, 0],
    [0, 0],
  ];

  List<int> _careFrequencyInDays = [0, 0, 0];

  List<bool> _careFlags = [false, false, false];
  bool _submit = false;

  bool getSumbit() {
    return _submit;
  }

  int getChanged() {
    return _changed;
  }

  int careChanged() {
    return _careFlagsChanged;
  }

  String getCareFrequencyText(int index) {
    return _careFrequencyText[index];
  }

  String? validateName() {
    if (_plantNameController.text.isEmpty) {
      return 'Enter plant\'s name';
    }
    if (_plantNameController.text.length < 4) {
      return 'Too short';
    }
    if (_plantNameController.text.length > 12) {
      return 'Too long';
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

  String validateCare() {
    if ((_careFlags[0] == false) &&
        (_careFlags[1] == false) &&
        (_careFlags[2] == false) &&
        _submit == true) {
      return "Select at least one type of care";
    }
    return "Type of care";
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

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  String getImagePath() {
    return _imagePath;
  }

  void setPlantName(String name) {
    _plantNameController.text = name;
  }

  TextEditingController getPlantNameController() {
    return _plantNameController;
  }

  void setPlantDescription(String description) {
    _plantDescriptionController.text = description;
  }

  TextEditingController getPlantDescriptionController() {
    return _plantDescriptionController;
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

  void initializeController(Plant plant) {
    this.setPlantName(plant.getName());
    this.setPlantDescription(plant.getDescription());
    this.setImagePath(plant.getImagePath());

    _careFlags = [
      plant.getWatering().getEnabled(),
      plant.getSpraying().getEnabled(),
      plant.getFertilizing().getEnabled()
    ];

    _careFrequency = [
      [
        plant.getWatering().getFrequencyIndex(),
        plant.getWatering().getTimeIndex()
      ],
      [
        plant.getSpraying().getFrequencyIndex(),
        plant.getSpraying().getTimeIndex()
      ],
      [
        plant.getFertilizing().getFrequencyIndex(),
        plant.getFertilizing().getTimeIndex()
      ],
    ];

    this.updateCareFrequencyText(0);
    this.updateCareFrequencyText(1);
    this.updateCareFrequencyText(2);
    _submit = false;
  }

  void saveChanges(Plant plant, BuildContext context,
      AchievementController controller, Achievements achievements) {
    _submit = true;
    if ((this.validateDescription() == null) &&
        (this.validateName() == null) &&
        (this.validateCare() == "Type of care") &&
        (_imagePath != "")) {
      _transformCareFrequency();
      if (plant.getName() != _plantNameController.text) {
        controller.unlockRenameAchievement(achievements);
      }
      plant.setName(_plantNameController.text);
      if ((plant.getDescription() == "") &&
          (plant.getDescription() != _plantDescriptionController.text)) {
        controller.unlockDescriptionAchievement(achievements);
      }
      plant.setDescription(_plantDescriptionController.text);

      if ((plant.getWatering().getEnabled() == false) &&
          (_careFlags[0] == true)) {
        plant.getWatering().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      plant.getWatering().setFrequency(_careFrequencyInDays[0]);
      plant.getWatering().setEnabled(_careFlags[0]);
      plant.getWatering().setFrequencyIndex(_careFrequency[0][0]);
      plant.getWatering().setTimeIndex(_careFrequency[0][1]);
      plant.getWatering().updateNextCareTime();

      if ((plant.getSpraying().getEnabled() == false) &&
          (_careFlags[1] == true)) {
        plant.getSpraying().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      plant.getSpraying().setFrequency(_careFrequencyInDays[1]);
      plant.getSpraying().setEnabled(_careFlags[1]);
      plant.getSpraying().setFrequencyIndex(_careFrequency[1][0]);
      plant.getSpraying().setTimeIndex(_careFrequency[1][1]);
      plant.getSpraying().updateNextCareTime();

      if ((plant.getFertilizing().getEnabled() == false) &&
          (_careFlags[2] == true)) {
        plant.getFertilizing().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      plant.getFertilizing().setFrequency(_careFrequencyInDays[2]);
      plant.getFertilizing().setEnabled(_careFlags[2]);
      plant.getFertilizing().setFrequencyIndex(_careFrequency[2][0]);
      plant.getFertilizing().setTimeIndex(_careFrequency[2][1]);
      plant.getFertilizing().updateNextCareTime();

      plant.setImagePath(_imagePath);
      _changed += 1;
      Navigator.pop(context);
    }

    notifyListeners();
  }

  void deletePlant(Plants plants, Plant plant) {
    plants.removePlant(plant.getName());
  }
}
