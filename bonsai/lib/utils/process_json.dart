import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/plants.dart';

void readJson(Plants plants) async {
  final String json = await rootBundle.loadString("assets/data/app_data.json");
  final jsonData = jsonDecode(json);
  for (var plant in jsonData['plants']) {
    plants.addPlant(
        plant['name'],
        plant['description'],
        plant['watering_frequency'],
        plant['watering'],
        plant['watering_frequency_index'],
        plant['watering_frequency_time_index'],
        plant['spraying_frequency'],
        plant['spraying'],
        plant['spraying_frequency_index'],
        plant['spraying_frequency_time_index'],
        plant['fertilizing_frequency'],
        plant['fertilizing'],
        plant['fertilizing_frequency_index'],
        plant['fertilizing_frequency_time_index'],
        plant['image_path']);
  }
}
