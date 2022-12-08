import 'package:flutter/material.dart';

import '../../views/achievements_page/achievements_page.dart';
import '../../views/home_page/home_page.dart';
import '../../views/settings_page/settings_page.dart';
import '../../views/tips_page/tips_page.dart';

class NavigationController extends ChangeNotifier {
  List<Widget> _pages = [
    HomePage(),
    TipsPage(),
    AchievementsPage(),
    SettingsPage(),
  ];

  int _currentPageIndex = 0;
  Widget _currentPage = HomePage();
  PageStorageBucket _bucket = PageStorageBucket();

  Widget getCurrentPage() {
    return _currentPage;
  }

  PageStorageBucket getBucket() {
    return _bucket;
  }

  void updateCurrentPage(int index) {
    _currentPageIndex = index;
    _currentPage = _pages[_currentPageIndex];
    notifyListeners();
  }

  int getCurrentPageIndex() {
    return _currentPageIndex;
  }
}
