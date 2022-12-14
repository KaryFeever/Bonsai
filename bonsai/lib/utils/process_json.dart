import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/plants.dart';

Future<String> readContent(Plants plants) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  Map jsonData = jsonDecode(pref.getString('userData4')!);

  for (int i = 0; i < jsonData['plants']['plants_counter']; i++) {
    plants.addPlant(
        jsonData['plants']['plants_list'][i]["name"],
        jsonData['plants']['plants_list'][i]["description"],
        jsonData['plants']['plants_list'][i]["watering"]['frequency'],
        jsonData['plants']['plants_list'][i]["watering"]['enable'],
        jsonData['plants']['plants_list'][i]["watering"]['frequency_index'],
        jsonData['plants']['plants_list'][i]["watering"]['time_index'],
        jsonData['plants']['plants_list'][i]["spraying"]['frequency'],
        jsonData['plants']['plants_list'][i]["spraying"]['enable'],
        jsonData['plants']['plants_list'][i]["spraying"]['frequency_index'],
        jsonData['plants']['plants_list'][i]["spraying"]['time_index'],
        jsonData['plants']['plants_list'][i]["fertilizing"]['frequency'],
        jsonData['plants']['plants_list'][i]["fertilizing"]['enable'],
        jsonData['plants']['plants_list'][i]["fertilizing"]['frequency_index'],
        jsonData['plants']['plants_list'][i]["fertilizing"]['time_index'],
        jsonData['plants']['plants_list'][i]["image"]);
  }

  return jsonData['plants'];
}

void writeContent(Plants plants) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  // dynamic jsonString;
  String plantsString = "";
  for (int i = 0; i < plants.getPlantsCounter(); i++) {
    plantsString += "{" +
        "\"name\": \"${plants.getPlants()[i].getName()}\"," +
        "\"description\": \"${plants.getPlants()[i].getDescription()}\"," +
        "\"image\": \"${plants.getPlants()[i].getImagePath()}\"," +
        "\"watering\": {" +
        "\"name\": \"Watering\"," +
        "\"frequency\": ${plants.getPlants()[i].getWatering().getFrequency()}," +
        "\"frequency_index\":${plants.getPlants()[i].getWatering().getFrequencyIndex()}," +
        "\"time_index\": ${plants.getPlants()[i].getWatering().getTimeIndex()}," +
        "\"enable\": ${plants.getPlants()[i].getWatering().getEnabled()}," +
        "\"lastCare\": \"\"," +
        "\"nextCare\": \"\"" +
        "}," +
        "\"spraying\": {" +
        "\"name\": \"Spraying\"," +
        "\"frequency\": ${plants.getPlants()[i].getSpraying().getFrequency()}," +
        "\"frequency_index\":${plants.getPlants()[i].getSpraying().getFrequencyIndex()}," +
        "\"time_index\": ${plants.getPlants()[i].getSpraying().getTimeIndex()}," +
        "\"enable\": ${plants.getPlants()[i].getSpraying().getEnabled()}," +
        "\"lastCare\": \"\"," +
        "\"nextCare\": \"\"" +
        "}," +
        "\"fertilizing\": {" +
        "\"name\": \"Fertilizing\"," +
        "\"frequency\": ${plants.getPlants()[i].getFertilizing().getFrequency()}," +
        "\"frequency_index\":${plants.getPlants()[i].getFertilizing().getFrequencyIndex()}," +
        "\"time_index\": ${plants.getPlants()[i].getFertilizing().getTimeIndex()}," +
        "\"enable\": ${plants.getPlants()[i].getFertilizing().getEnabled()}," +
        "\"lastCare\": \"\"," +
        "\"nextCare\": \"\"" +
        "}" +
        "}";
    if (i != plants.getPlantsCounter() - 1) {
      plantsString += ",";
    }
  }
  String jsonString = "{ " +
      "\"plants\": { " +
      "\"plants_counter\": ${plants.getPlantsCounter()}," +
      " \"plants_list\": [ $plantsString ]" +
      "}" +
      "}";

  String json = jsonEncode(jsonDecode(jsonString));
  pref.setString('userData4', json);
}
