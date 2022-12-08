import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/models/plants.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setup() {
  locator.registerSingleton<NavigationController>(NavigationController());
  locator.registerSingleton<CreationController>(CreationController());
  locator.registerSingleton<Plants>(Plants());
}
