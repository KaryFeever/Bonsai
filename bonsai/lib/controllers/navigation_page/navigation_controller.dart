import 'package:flutter/widgets.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../views/achievements_page/achievements_page.dart';
import '../../views/home_page/home_page.dart';
import '../../views/settings_page/settings_page.dart';
import '../../views/tips_page/tips_page.dart';

class NavigationController extends ControllerMVC {
  factory NavigationController() => _this ??= NavigationController._();
  NavigationController._();
  static NavigationController? _this;

  int _currentPageIndex = 0;
  final List<Widget> _pages = [HomePage(), TipsPage(), AchievementsPage(), SettingsPage()];
  final PageStorageBucket _bucket = PageStorageBucket();
  Widget _currentPage = HomePage();

  void UpdatePage(int index) {
    _currentPageIndex = index;
    _currentPage = _pages[_currentPageIndex];
  }

  Widget getCurrentPage() {
    return _currentPage;
  }

  PageStorageBucket getBucket() {
    return _bucket;
  }

  int getCurrentPageIndex() {
    return _currentPageIndex;
  }
}
