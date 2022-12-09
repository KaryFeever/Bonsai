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
        plant['spraying_frequency'],
        plant['spraying'],
        plant['fertilizing_frequency'],
        plant['fertilizing'],
        plant['image_path']);
  }
}
