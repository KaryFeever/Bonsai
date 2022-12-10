import 'package:flutter/material.dart';

import '../../models/plant.dart';
import '../../models/plants.dart';

class EditController extends ChangeNotifier {
  int _changed = 0;

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

  int getChanged() {
    return _changed;
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
  }

  void saveChanges(Plant plant) {
    _transformCareFrequency();
    plant.setName(_plantNameController.text);
    plant.setDescription(_plantDescriptionController.text);

    plant.getWatering().setFrequency(_careFrequencyInDays[0]);
    plant.getWatering().setEnabled(_careFlags[0]);
    plant.getWatering().setFrequencyIndex(_careFrequency[0][0]);
    plant.getWatering().setTimeIndex(_careFrequency[0][1]);

    plant.getSpraying().setFrequency(_careFrequencyInDays[1]);
    plant.getSpraying().setEnabled(_careFlags[1]);
    plant.getSpraying().setFrequencyIndex(_careFrequency[1][0]);
    plant.getSpraying().setTimeIndex(_careFrequency[1][1]);

    plant.getFertilizing().setFrequency(_careFrequencyInDays[2]);
    plant.getFertilizing().setEnabled(_careFlags[2]);
    plant.getFertilizing().setFrequencyIndex(_careFrequency[2][0]);
    plant.getFertilizing().setTimeIndex(_careFrequency[2][1]);

    plant.setImagePath(_imagePath);
    _changed += 1;
    notifyListeners();
  }

  void deletePlant(Plants plants, Plant plant) {
    plants.removePlant(plant.getName());
  }
}
