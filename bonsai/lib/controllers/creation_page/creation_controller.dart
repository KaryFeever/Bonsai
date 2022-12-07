import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class CreationController extends ControllerMVC {
  factory CreationController() => _this ??= CreationController._();
  CreationController._();
  static CreationController? _this;

  List<bool> _careFlags = [false, false, false];

  void UpdateFlag(bool value, int index) {
    _careFlags[index] = value;
  }

  bool getFlag(int index) {
    return _careFlags[index];
  }
}
