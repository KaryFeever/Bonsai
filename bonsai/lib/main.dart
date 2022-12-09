import 'package:bonsai/get_it_mixins/locator.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/utils/process_json.dart';
import 'package:bonsai/views/navigation_page/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // readJson(get<Plants>());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bonsai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationPage(),
    );
  }
}
