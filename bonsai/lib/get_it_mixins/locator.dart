/// Register all needed controllers and classes to be global accessed
/// Authors:
/// - Naumenko Maksim (xnaume01)
/// - Mikhailov Kirill (xmikha00)
/// - Kovalets Vladyslav (xkoval21)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/edit_category_page/edit_category_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/home_page/home_controller.dart';
import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/controllers/settings_page/settings_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/models/plants.dart';
import 'package:get_it/get_it.dart';
import 'package:bonsai/controllers/categories_page/categories_controller.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<CreationController>(CreationController());
  locator.registerSingleton<AchievementController>(AchievementController());
  locator.registerSingleton<SettingsController>(SettingsController());
  locator.registerSingleton<EditController>(EditController());
  locator.registerSingleton<Plants>(Plants());
  locator.registerSingleton<PlantController>(PlantController());
  locator.registerSingleton<HomeController>(HomeController());
  locator.registerSingleton<Achievements>(Achievements());
  locator.registerSingleton<Categories>(Categories());
  locator.registerSingleton<CreationCategoryController>(
      CreationCategoryController());
  locator.registerSingleton<EditCategoryController>(EditCategoryController());
}
