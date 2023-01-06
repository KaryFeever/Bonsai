/// Functions for parsing json file
/// Author: Naumenko Maksim (xnaume01)
import 'dart:convert';
import 'package:bonsai/models/achievement_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/plants.dart';

Future<String> readContent(Plants plants, Achievements achievements) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Map jsonData = jsonDecode(pref.getString('structure')!);

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
        jsonData['plants']['plants_list'][i]['image']);
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

void writeContent(Plants plants, Achievements achievements) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  pref.clear();
  // dynamic jsonString;
  String plantsString = '';
  for (int i = 0; i < plants.getPlantsCounter(); i++) {
    plantsString += '{' +
        '\'name\': \'${plants.getPlants()[i].getName()}\',' +
        '\'description\': \'${plants.getPlants()[i].getDescription()}\',' +
        '\'image\': \'${plants.getPlants()[i].getImagePath()}\',' +
        '\'watering\': {' +
        '\'name\': \'Watering\',' +
        '\'frequency\': ${plants.getPlants()[i].getWatering().getFrequency()},' +
        '\'frequency_index\':${plants.getPlants()[i].getWatering().getFrequencyIndex()},' +
        '\'time_index\': ${plants.getPlants()[i].getWatering().getTimeIndex()},' +
        '\'enable\': ${plants.getPlants()[i].getWatering().getEnabled()},' +
        '\'lastCare\': \'\',' +
        '\'nextCare\': \'\'' +
        '},' +
        '\'spraying\': {' +
        '\'name\': \'Spraying\',' +
        '\'frequency\': ${plants.getPlants()[i].getSpraying().getFrequency()},' +
        '\'frequency_index\':${plants.getPlants()[i].getSpraying().getFrequencyIndex()},' +
        '\'time_index\': ${plants.getPlants()[i].getSpraying().getTimeIndex()},' +
        '\'enable\': ${plants.getPlants()[i].getSpraying().getEnabled()},' +
        '\'lastCare\': \'\',' +
        '\'nextCare\': \'\'' +
        '},' +
        '\'fertilizing\': {' +
        '\'name\': \'Fertilizing\',' +
        '\'frequency\': ${plants.getPlants()[i].getFertilizing().getFrequency()},' +
        '\'frequency_index\':${plants.getPlants()[i].getFertilizing().getFrequencyIndex()},' +
        '\'time_index\': ${plants.getPlants()[i].getFertilizing().getTimeIndex()},' +
        '\'enable\': ${plants.getPlants()[i].getFertilizing().getEnabled()},' +
        '\'lastCare\': \'\',' +
        '\'nextCare\': \'\'' +
        '}' +
        '}';
    if (i != plants.getPlantsCounter() - 1) {
      plantsString += ',';
    }
  }

  String achievementsString = '';

  for (int i = 0; i < achievements.getCountOfAchievements(); i++) {
    achievementsString += '{' +
        '\'name\': \'${achievements.getAchievement(i).getName()}\',' +
        '\'description\': \'${achievements.getAchievement(i).getDescription()}\',' +
        '\'svg\': \'${achievements.getAchievement(i).getSvgPath()}\',' +
        '\'unlocked\': ${achievements.getAchievement(i).getStatus()}' +
        '}';
    if (i != achievements.getCountOfAchievements() - 1) {
      achievementsString += ',';
    }
  }
  String jsonString = '{ ' +
      '\'plants\': { ' +
      '\'plants_counter\': ${plants.getPlantsCounter()},' +
      ' \'plants_list\': [ $plantsString ]' +
      '},'
          '\'achievements\': {' +
      '\'achievements_list\': [ $achievementsString ],' +
      '\'watering_counter\': ${achievements.getWateringCounter()},' +
      '\'spraying_counter\': ${achievements.getSprayingCounter()},' +
      '\'fertilizing_counter\': ${achievements.getFertilizingCounter()}'
          '}' +
      '}';

  String json = jsonEncode(jsonDecode(jsonString));

  pref.setString('structure', json);
}
