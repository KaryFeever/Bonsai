import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CreationController extends ControllerMVC {
  factory CreationController() => _this ??= CreationController._();
  CreationController._();
  static CreationController? _this;

  List<bool> _careFlags = [false, false, false];
  List<int> _careFrequency = [0, 0, 0];

  String _plantName = "";
  String _plantDescription = "";

  

  void UpdateFlag(bool value, int index) {
    _careFlags[index] = value;
  }

  bool getFlag(int index) {
    return _careFlags[index];
  }
}
