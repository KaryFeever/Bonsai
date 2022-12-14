import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/home_page/home_controller.dart';
import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/plants.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<CreationController>(CreationController());
  locator.registerSingleton<AchievementController>(AchievementController());
  locator.registerSingleton<EditController>(EditController());
  locator.registerSingleton<Plants>(Plants());
}
