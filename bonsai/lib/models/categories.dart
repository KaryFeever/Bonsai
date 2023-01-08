/// Model for the Categories
/// Authors: Naumenko Maksim (xnaume01)
///          Vladyslav Kovalets (xkoval21)

import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/models/plant.dart';
import 'package:bonsai/views/edit_page/edit_page.dart';
import 'package:flutter/material.dart';
import 'package:bonsai/models/category.dart';

class Categories extends ChangeNotifier {
  int _categories_counter = 0;

  List<Category> _categories = [];

  List<Category> getCategories() {
    return _categories;
  }

  int getCategoriesCounter() {
    return _categories_counter;
  }

  void addCategory(
      String name,
      String description,
      int wateringFrequency,
      bool watering,
      int wateringFrequencyIndex,
      int wateringFrequencyTimeIndex,
      int sprayingFrequency,
      bool spraying,
      int sprayingFrequencyIndex,
      int sprayingFrequencyTimeIndex,
      int fertilizingFrequency,
      bool fertilizing,
      int fertilizingFrequencyIndex,
      int fertilizingFrequencyTimeIndex) {
    Category category = Category();
    category.setName(name);
    category.setDescription(description);

    if (watering) {
      category.getWatering().setEnabled(watering);
      category.getWatering().setFrequency(wateringFrequency);
      category.getWatering().setFrequencyIndex(wateringFrequencyIndex);
      category.getWatering().setTimeIndex(wateringFrequencyTimeIndex);
      category.getWatering().setCareTime(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day));
      category.getWatering().updateNextCareTime();
    }
    if (spraying) {
      category.getSpraying().setEnabled(spraying);
      category.getSpraying().setFrequency(sprayingFrequency);
      category.getSpraying().setFrequencyIndex(sprayingFrequencyIndex);
      category.getSpraying().setTimeIndex(sprayingFrequencyTimeIndex);
      category.getSpraying().setCareTime(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day));
      category.getSpraying().updateNextCareTime();
    }
    if (fertilizing) {
      category.getFertilizing().setEnabled(fertilizing);
      category.getFertilizing().setFrequency(fertilizingFrequency);
      category.getFertilizing().setFrequencyIndex(fertilizingFrequencyIndex);
      category.getFertilizing().setTimeIndex(fertilizingFrequencyTimeIndex);
      category.getFertilizing().setCareTime(DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day));
      category.getFertilizing().updateNextCareTime();
    }

    _categories.add(category);
    _categories_counter++;
    notifyListeners();
  }

  Category? getCategory(String categoryName) {
    for (Category category in _categories) {
      if (category.getName() == categoryName) return category;
    }
    return null;
  }

  void removeCategory(String name, List<Plant> plants) {
    for (Category category in _categories) {
      if (category.getName() == name) {
        for (Plant plant in plants) {
          if (plant.getPlantCategory().getName() == name) {
            plant.removeCategory();
          }
        }

        _categories.removeAt(_categories.indexOf(category));
        _categories_counter--;

        selectedValue = Styles.notSelected;

        notifyListeners();
        break;
      }
    }
  }
}
