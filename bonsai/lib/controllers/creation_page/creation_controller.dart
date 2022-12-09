import 'package:bonsai/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../models/plant.dart';
import '../../models/plants.dart';

class CreationController extends ChangeNotifier {
  List<bool> _careFlags = [false, false, false];

  List<int> _careFrequencyInDays = [0, 0, 0];

  List _careFrequency = [
    [0, 0],
    [0, 0],
    [0, 0],
  ];

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

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
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

  void createPlant(Plants plants) {
    _transformCareFrequency();
    plants.addPlant(
        _plantNameController.text,
        _plantDescriptionController.text,
        _careFrequencyInDays[0],
        _careFlags[0],
        _careFrequencyInDays[1],
        _careFlags[1],
        _careFrequencyInDays[2],
        _careFlags[2],
        _imagePath);
    cancel();
  }
}
