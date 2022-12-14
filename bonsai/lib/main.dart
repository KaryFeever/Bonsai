/// Main class to execute the application
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/get_it_mixins/locator.dart';
import 'package:bonsai/views/navigation_page/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:bonsai/services/local_notification_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  LocalNotificationService().setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget with GetItMixin {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bonsai',
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.backgroundColor,
        primarySwatch: Colors.blue,
      ),
      home: NavigationPage(),
    );
  }
}
