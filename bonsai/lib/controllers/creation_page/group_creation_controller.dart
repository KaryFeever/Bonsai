/// Controller for the group creation page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/groups.dart';
import 'package:bonsai/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import '../../models/plants.dart';

class GroupCreationController extends ChangeNotifier {
  int _groupCounter = 0;

  final _groupNameController = TextEditingController();

  final _groupDescriptionController = TextEditingController();

  final _groupPlaceController = TextEditingController();

  String _imagePath = "";

  bool _submit = false;

  bool getSumbit() {
    return _submit;
  }

  void cancel() {
    _imagePath = "";
    _submit = false;
  }

  void setImagePath(String imagePath) {
    _imagePath = imagePath;
  }

  String getImagePath() {
    return _imagePath;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _groupNameController.dispose();
    _groupDescriptionController.dispose();
    super.dispose();
  }

  TextEditingController getGroupNameController() {
    return _groupNameController;
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

  TextEditingController getGroupDescriptionController() {
    return _groupDescriptionController;
  }

  TextEditingController getGroupPlaceController() {
    return _groupPlaceController;
  }

  void createGroup(Groups groups, BuildContext context) {
    _groupCounter++;
    _submit = true;
    if ((this.validateName() == null)) {
      groups.addGroup(
          _groupNameController.text,
          _groupDescriptionController.text,
          _imagePath,
          _groupPlaceController.text);

      Navigator.pop(context);

      notifyListeners();
    }
  }
}
