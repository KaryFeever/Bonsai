/// Controller for the settings page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:flutter/material.dart';

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
