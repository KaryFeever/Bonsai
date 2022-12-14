import 'package:bonsai/main.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class SettingsController extends ChangeNotifier {
  bool _darkTheme = false;
  bool _enableNotifications = true;

  bool isDarkTheme() {
    return _darkTheme;
  }

  void setDarkTheme(bool setting) {
    _darkTheme = !_darkTheme;
  }

  bool notificationsEnabled() {
    return _enableNotifications;
  }

  void setEnableNotifications(bool setting) {
    _enableNotifications = setting;
  }
}
