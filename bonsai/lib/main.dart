import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/get_it_mixins/locator.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/utils/process_json.dart';
import 'package:bonsai/views/navigation_page/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bonsai/services/local_notification_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
