/// Model for the Groups
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/models/group.dart';
import 'package:flutter/material.dart';

class Groups extends ChangeNotifier {
  int _groups_counter = 0;

  List<Group> _groups = [];

  Group? getGroup(String groupName) {
    for (Group group in _groups) {
      if (group.getName() == groupName) return group;
    }
    return null;
  }

  int getGroupsCounter() {
    return _groups_counter;
  }

  void addGroup(
      String name, String description, String imagePath, String place) {
    Group group = Group();
    group.setName(name);
    group.setDescription(description);
    group.setImagePath(imagePath);
    group.setPlace(place);

    _groups.add(group);
    _groups_counter++;
    notifyListeners();
  }

  void removeGroup(String name) {
    for (Group group in _groups) {
      if (group.getName() == name) {
        _groups.removeAt(_groups.indexOf(group));
        _groups_counter--;
        notifyListeners();
        break;
      }
    }
  }

  List<Group> getGroups() {
    return _groups;
  }
}
