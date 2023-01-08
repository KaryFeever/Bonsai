/// Controller for the edit category page
/// Authors: Naumenko Maksim (xnaume01)
///          Vladyslav Kovalets (xkoval21)

import 'package:bonsai/models/categories.dart';
import 'package:bonsai/models/category.dart';
import 'package:bonsai/models/plant.dart';
import 'package:flutter/material.dart';

class EditCategoryController extends ChangeNotifier {
  int _changed = 0;
  int _careFlagsChanged = 0;

  final _categoryNameController = TextEditingController();

  final _categoryDescriptionController = TextEditingController();

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
    if (_categoryNameController.text.isEmpty) {
      return 'Enter category\'s name';
    }
    // if (_categoryNameController.text.length < 4) {
    //   return 'Too short';
    // }
    // if (_categoryNameController.text.length > 12) {
    //   return 'Too long';
    // }
    return null;
  }

  String? validateDescription() {
    if ('\n'.allMatches(_categoryDescriptionController.text).length >= 3) {
      return 'Only 3 rows are available';
    }
    if (_categoryDescriptionController.text.length > 200) {
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

  void setCategoryName(String name) {
    _categoryNameController.text = name;
  }

  TextEditingController getCategoryNameController() {
    return _categoryNameController;
  }

  void setCategoryDescription(String description) {
    _categoryDescriptionController.text = description;
  }

  TextEditingController getCategoryDescriptionController() {
    return _categoryDescriptionController;
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

  void initializeController(Category category) {
    this.setCategoryName(category.getName());
    this.setCategoryDescription(category.getDescription());

    _careFlags = [
      category.getWatering().getEnabled(),
      category.getSpraying().getEnabled(),
      category.getFertilizing().getEnabled()
    ];

    _careFrequency = [
      [
        category.getWatering().getFrequencyIndex(),
        category.getWatering().getTimeIndex()
      ],
      [
        category.getSpraying().getFrequencyIndex(),
        category.getSpraying().getTimeIndex()
      ],
      [
        category.getFertilizing().getFrequencyIndex(),
        category.getFertilizing().getTimeIndex()
      ],
    ];

    this.updateCareFrequencyText(0);
    this.updateCareFrequencyText(1);
    this.updateCareFrequencyText(2);
    _submit = false;
  }

  void saveChanges(
    Category category,
    BuildContext context,
    List<Plant> plants,
  ) {
    _submit = true;
    if ((this.validateDescription() == null) &&
        (this.validateName() == null) &&
        (this.validateCare() == "Type of care")) {
      _transformCareFrequency();

      category.setName(_categoryNameController.text);

      category.setDescription(_categoryDescriptionController.text);

      if ((category.getWatering().getEnabled() == false) &&
          (_careFlags[0] == true)) {
        category.getWatering().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      category.getWatering().setFrequency(_careFrequencyInDays[0]);
      category.getWatering().setEnabled(_careFlags[0]);
      category.getWatering().setFrequencyIndex(_careFrequency[0][0]);
      category.getWatering().setTimeIndex(_careFrequency[0][1]);
      category.getWatering().updateNextCareTime();

      if ((category.getSpraying().getEnabled() == false) &&
          (_careFlags[1] == true)) {
        category.getSpraying().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      category.getSpraying().setFrequency(_careFrequencyInDays[1]);
      category.getSpraying().setEnabled(_careFlags[1]);
      category.getSpraying().setFrequencyIndex(_careFrequency[1][0]);
      category.getSpraying().setTimeIndex(_careFrequency[1][1]);
      category.getSpraying().updateNextCareTime();

      if ((category.getFertilizing().getEnabled() == false) &&
          (_careFlags[2] == true)) {
        category.getFertilizing().setCareTime(DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
      }
      category.getFertilizing().setFrequency(_careFrequencyInDays[2]);
      category.getFertilizing().setEnabled(_careFlags[2]);
      category.getFertilizing().setFrequencyIndex(_careFrequency[2][0]);
      category.getFertilizing().setTimeIndex(_careFrequency[2][1]);
      category.getFertilizing().updateNextCareTime();

      _changed += 1;
      Navigator.pop(context);
    }

    updatePlants(category, context, plants);

    notifyListeners();
  }

  // for every plant in the category, update the care
  void updatePlants(
      Category category, BuildContext context, List<Plant> plants) {
    for (Plant plant in plants) {
      if (plant.getPlantCategory()!.getName() == category.getName()) {
        plant.getWatering().setFrequency(category.getWatering().getFrequency());
        plant
            .getWatering()
            .setFrequencyIndex(category.getWatering().getFrequencyIndex());
        plant.getWatering().setTimeIndex(category.getWatering().getTimeIndex());
        plant.getWatering().setEnabled(category.getWatering().getEnabled());
        plant.getWatering().updateNextCareTime();

        plant.getSpraying().setFrequency(category.getSpraying().getFrequency());
        plant
            .getSpraying()
            .setFrequencyIndex(category.getSpraying().getFrequencyIndex());
        plant.getSpraying().setTimeIndex(category.getSpraying().getTimeIndex());
        plant.getSpraying().setEnabled(category.getSpraying().getEnabled());
        plant.getSpraying().updateNextCareTime();

        plant
            .getFertilizing()
            .setFrequency(category.getFertilizing().getFrequency());
        plant
            .getFertilizing()
            .setFrequencyIndex(category.getFertilizing().getFrequencyIndex());
        plant
            .getFertilizing()
            .setTimeIndex(category.getFertilizing().getTimeIndex());
        plant
            .getFertilizing()
            .setEnabled(category.getFertilizing().getEnabled());
        plant.getFertilizing().updateNextCareTime();
        notifyListeners();
      }
    }
  }

  void deleteCategory(Categories categories, Category category) {
    categories.removeCategory(category.getName());
  }
}
