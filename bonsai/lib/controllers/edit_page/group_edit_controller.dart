/// Controller for the edit plant page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/groups.dart';
import 'package:flutter/material.dart';
import '../../models/plant.dart';
import '../../models/plants.dart';
import '../../models/group.dart';

class GroupEditController extends ChangeNotifier {
  int _changes = 0;

  final _groupNameController = TextEditingController();

  final _groupDescriptionController = TextEditingController();

  final _groupPlaceController = TextEditingController();

  String _imagePath = "";

  bool _submit = false;

  int getChanges() {
    return _changes;
  }

  bool getSumbit() {
    return _submit;
  }

  void updateGroup(Plants plants, Group group, List<bool?> toRefresh) {
    for (int i = 0; i < toRefresh.length; i++) {
      if (toRefresh[i] == true) {
        if (!group.getPlantFromList(plants.getPlants()[i].getName())) {
          group.getPlantList().add(plants.getPlants()[i]);
        }
      } else {
        if (group.getPlantFromList(plants.getPlants()[i].getName())) {
          group.removePlantFromGroup(plants.getPlants()[i].getName());
        }
      }
    }
    _changes++;
    notifyListeners();
  }

  String? validateName() {
    if (_submit) {
      if (_groupNameController.text.isEmpty) {
        return 'Enter group\'s name';
      }
      if (_groupNameController.text.length < 4) {
        return 'Too short';
      }
      if (_groupNameController.text.length > 12) {
        return 'Too long';
      }
    }
    return null;
  }

  String? validateDescription() {
    if ('\n'.allMatches(_groupDescriptionController.text).length >= 3) {
      return 'Only 3 rows are available';
    }
    if (_groupDescriptionController.text.length > 100) {
      return 'Too long';
    }
    return null;
  }

  String? validatePlace() {
    if (_groupDescriptionController.text.length > 50) {
      return 'Too long';
    }
    return null;
  }

  TextEditingController getGroupNameController() {
    return _groupNameController;
  }

  TextEditingController getGroupDescriptionController() {
    return _groupDescriptionController;
  }

  TextEditingController getGroupPlaceController() {
    return _groupPlaceController;
  }

  void deleteGroup(Groups groups, Group group) {
    groups.removeGroup(group.getName());
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  String getImagePath() {
    return _imagePath;
  }

  void setGroupName(String name) {
    _groupNameController.text = name;
  }

  void setGroupDescription(String description) {
    _groupDescriptionController.text = description;
  }

  void setGroupPlace(String place) {
    _groupPlaceController.text = place;
  }

  void saveChanges(
    Group group,
    BuildContext context,
  ) {
    _submit = true;
    if ((this.validateDescription() == null) &&
        (this.validateName() == null) &&
        (this.validatePlace() == null)) {
      group.setName(_groupNameController.text);
      group.setDescription(_groupDescriptionController.text);

      group.setImagePath(_imagePath);
      _changes += 1;
      Navigator.pop(context);
    }

    notifyListeners();
  }

  void initializeController(Group group) {
    this.setGroupName(group.getName());
    this.setGroupDescription(group.getDescription());
    this.setImagePath(group.getImagePath());

    _submit = false;
  }
}
