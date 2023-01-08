/// Functions for parsing json file
/// Author: Naumenko Maksim (xnaume01)
import 'dart:convert';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/categories.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/plants.dart';

Future<String> readContent(
    Plants plants, Achievements achievements, Categories categories) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Map jsonData = jsonDecode(pref.getString('structure')!);

  for (int i = 0; i < jsonData['categories']['categories_counter']; i++) {
    categories.addCategory(
        jsonData['categories']['categories_list'][i]['name'],
        jsonData['categories']['categories_list'][i]['description'],
        jsonData['categories']['categories_list'][i]['watering']['frequency'],
        jsonData['categories']['categories_list'][i]['watering']['enable'],
        jsonData['categories']['categories_list'][i]['watering']
            ['frequency_index'],
        jsonData['categories']['categories_list'][i]['watering']['time_index'],
        jsonData['categories']['categories_list'][i]['spraying']['frequency'],
        jsonData['categories']['categories_list'][i]['spraying']['enable'],
        jsonData['categories']['categories_list'][i]['spraying']
            ['frequency_index'],
        jsonData['categories']['categories_list'][i]['spraying']['time_index'],
        jsonData['categories']['categories_list'][i]['fertilizing']
            ['frequency'],
        jsonData['categories']['categories_list'][i]['fertilizing']['enable'],
        jsonData['categories']['categories_list'][i]['fertilizing']
            ['frequency_index'],
        jsonData['categories']['categories_list'][i]['fertilizing']
            ['time_index']);
  }

  for (int i = 0; i < jsonData['plants']['plants_counter']; i++) {
    plants.addPlant(
        jsonData['plants']['plants_list'][i]['name'],
        jsonData['plants']['plants_list'][i]['description'],
        jsonData['plants']['plants_list'][i]['watering']['frequency'],
        jsonData['plants']['plants_list'][i]['watering']['enable'],
        jsonData['plants']['plants_list'][i]['watering']['frequency_index'],
        jsonData['plants']['plants_list'][i]['watering']['time_index'],
        jsonData['plants']['plants_list'][i]['spraying']['frequency'],
        jsonData['plants']['plants_list'][i]['spraying']['enable'],
        jsonData['plants']['plants_list'][i]['spraying']['frequency_index'],
        jsonData['plants']['plants_list'][i]['spraying']['time_index'],
        jsonData['plants']['plants_list'][i]['fertilizing']['frequency'],
        jsonData['plants']['plants_list'][i]['fertilizing']['enable'],
        jsonData['plants']['plants_list'][i]['fertilizing']['frequency_index'],
        jsonData['plants']['plants_list'][i]['fertilizing']['time_index'],
        jsonData['plants']['plants_list'][i]['image'],
        jsonData['plants']['plants_list'][i]["category"],
        categories);
  }

  for (int i = 0; i < 12; i++) {
    if (jsonData['achievements']['achievements_list'][i]['unlocked']) {
      achievements.getAchievement(i).achievementUnlock();
    }
  }
  achievements.setWateringCounter(jsonData['achievements']['watering_counter']);
  achievements.setSprayingCounter(jsonData['achievements']['spraying_counter']);
  achievements
      .setFertilizingCounter(jsonData['achievements']['fertilizing_counter']);
  return jsonData['plants'];
}

void writeContent(
    Plants plants, Achievements achievements, Categories categories) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  // dynamic jsonString;
  String plantsString = '';
  for (int i = 0; i < plants.getPlantsCounter(); i++) {
    plantsString += '{' +
        '\"name\": \"${plants.getPlants()[i].getName()}\",' +
        '\"description\": \"${plants.getPlants()[i].getDescription()}\",' +
        '\"category\": \"${plants.getPlants()[i].getPlantCategory().getName()}\",' +
        '\"image\": \"${plants.getPlants()[i].getImagePath()}\",' +
        '\"watering\": {' +
        '\"name\": \"Watering\",' +
        '\"frequency\": ${plants.getPlants()[i].getWatering().getFrequency()},' +
        '\"frequency_index\":${plants.getPlants()[i].getWatering().getFrequencyIndex()},' +
        '\"time_index\": ${plants.getPlants()[i].getWatering().getTimeIndex()},' +
        '\"enable\": ${plants.getPlants()[i].getWatering().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '},' +
        '\"spraying\": {' +
        '\"name\": \"Spraying\",' +
        '\"frequency\": ${plants.getPlants()[i].getSpraying().getFrequency()},' +
        '\"frequency_index\":${plants.getPlants()[i].getSpraying().getFrequencyIndex()},' +
        '\"time_index\": ${plants.getPlants()[i].getSpraying().getTimeIndex()},' +
        '\"enable\": ${plants.getPlants()[i].getSpraying().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '},' +
        '\"fertilizing\": {' +
        '\"name\": \"Fertilizing\",' +
        '\"frequency\": ${plants.getPlants()[i].getFertilizing().getFrequency()},' +
        '\"frequency_index\":${plants.getPlants()[i].getFertilizing().getFrequencyIndex()},' +
        '\"time_index\": ${plants.getPlants()[i].getFertilizing().getTimeIndex()},' +
        '\"enable\": ${plants.getPlants()[i].getFertilizing().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '}' +
        '}';
    if (i != plants.getPlantsCounter() - 1) {
      plantsString += ',';
    }
  }

  String achievementsString = '';

  for (int i = 0; i < achievements.getCountOfAchievements(); i++) {
    achievementsString += '{' +
        '\"name\": \"${achievements.getAchievement(i).getName()}\",' +
        '\"description\": \"${achievements.getAchievement(i).getDescription()}\",' +
        '\"svg\": \"${achievements.getAchievement(i).getSvgPath()}\",' +
        '\"unlocked\": ${achievements.getAchievement(i).getStatus()}' +
        '}';
    if (i != achievements.getCountOfAchievements() - 1) {
      achievementsString += ',';
    }
  }

  String categoriesString = '';

  for (int i = 0; i < categories.getCategoriesCounter(); i++) {
    categoriesString += '{' +
        '\"name\": \"${categories.getCategories()[i].getName()}\",' +
        '\"description\": \"${categories.getCategories()[i].getDescription()}\",' +
        '\"watering\": {' +
        '\"name\": \"Watering\",' +
        '\"frequency\": ${categories.getCategories()[i].getWatering().getFrequency()},' +
        '\"frequency_index\":${categories.getCategories()[i].getWatering().getFrequencyIndex()},' +
        '\"time_index\": ${categories.getCategories()[i].getWatering().getTimeIndex()},' +
        '\"enable\": ${categories.getCategories()[i].getWatering().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '},' +
        '\"spraying\": {' +
        '\"name\": \"Spraying\",' +
        '\"frequency\": ${categories.getCategories()[i].getSpraying().getFrequency()},' +
        '\"frequency_index\":${categories.getCategories()[i].getSpraying().getFrequencyIndex()},' +
        '\"time_index\": ${categories.getCategories()[i].getSpraying().getTimeIndex()},' +
        '\"enable\": ${categories.getCategories()[i].getSpraying().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '},' +
        '\"fertilizing\": {' +
        '\"name\": \"Fertilizing\",' +
        '\"frequency\": ${categories.getCategories()[i].getFertilizing().getFrequency()},' +
        '\"frequency_index\":${categories.getCategories()[i].getFertilizing().getFrequencyIndex()},' +
        '\"time_index\": ${categories.getCategories()[i].getFertilizing().getTimeIndex()},' +
        '\"enable\": ${categories.getCategories()[i].getFertilizing().getEnabled()},' +
        '\"lastCare\": \"\",' +
        '\"nextCare\": \"\"' +
        '}' +
        '}';
    if (i != categories.getCategoriesCounter() - 1) {
      categoriesString += ',';
    }
  }

  String jsonString = '{ ' +
      '\"plants\": { ' +
      '\"plants_counter\": ${plants.getPlantsCounter()},' +
      '\"plants_list\": [ $plantsString ]' +
      '},' +
      '\"categories\": { ' +
      '\"categories_counter\": ${categories.getCategoriesCounter()},' +
      '\"categories_list\": [ $categoriesString ]' +
      '},' +
      '\"achievements\": {' +
      '\"achievements_list\": [ $achievementsString ],' +
      '\"watering_counter\": ${achievements.getWateringCounter()},' +
      '\"spraying_counter\": ${achievements.getSprayingCounter()},' +
      '\"fertilizing_counter\": ${achievements.getFertilizingCounter()}'
          '}' +
      '}';

  String json = jsonEncode(jsonDecode(jsonString));

  pref.setString('structure', json);
}
