/// Register all needed controllers and classes to be global accessed
/// Authors:
/// - Naumenko Maksim (xnaume01)
/// - Mikhailov Kirill (xmikha00)
/// - Kovalets Vladyslav (xkoval21)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/creation_page/group_creation_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/edit_page/group_edit_controller.dart';
import 'package:bonsai/controllers/home_page/home_controller.dart';
import 'package:bonsai/controllers/group_page/group_controller.dart';
import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/controllers/settings_page/settings_controller.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/models/group.dart';
import 'package:bonsai/models/groups.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<CreationController>(CreationController());
  locator.registerSingleton<GroupCreationController>(GroupCreationController());
  locator.registerSingleton<AchievementController>(AchievementController());
  locator.registerSingleton<GroupController>(GroupController());
  locator.registerSingleton<SettingsController>(SettingsController());
  locator.registerSingleton<EditController>(EditController());
  locator.registerSingleton<GroupEditController>(GroupEditController());
  locator.registerSingleton<Plants>(Plants());
  locator.registerSingleton<Group>(Group());
  locator.registerSingleton<Groups>(Groups());
  locator.registerSingleton<PlantController>(PlantController());
  locator.registerSingleton<HomeController>(HomeController());
  locator.registerSingleton<Achievements>(Achievements());
}
