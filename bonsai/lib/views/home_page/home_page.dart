/// View for the home page
/// Authors:
/// - Kovalets Vladyslav (xkoval21)
/// - Naumenko Maksim (xnaume01)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/home_page/home_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/services/local_notification_service.dart';
import 'package:bonsai/views/creation_page/creation_page.dart';
import 'package:bonsai/views/plant_page/plant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../models/plants.dart';
import '../../constants/styles.dart';

class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {
  HomePage({super.key});
  late final LocalNotificationService service;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    int plantsCounter = watchOnly((Plants x) => x.getPlantsCounter());
    watchOnly((EditController x) => x.getChanged());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(126),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            // Shadow of the appbar.
            BoxShadow(
              color: Color(0x33979797),
              blurRadius: 60,
            ),
          ]),
          child: AppBar(
            toolbarHeight: 126,
            backgroundColor: Colors.white,
            shadowColor: Color(0x33979797),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            )),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your plants",
                      style: Styles.headLine1,
                    ),
                    // Check if plants need care today.
                    if (plantsCounter > 0 &&
                        HomeController()
                            .careTodayPlantsNeeded(get<Plants>().getPlants()))
                      Text(
                        "${HomeController().counterPlantsToCareToday(get<Plants>().getPlants())} plants need care",
                        style: Styles.textGray,
                      )
                    else if (plantsCounter > 0 &&
                        !HomeController()
                            .careTodayPlantsNeeded(get<Plants>().getPlants()))
                      Text(
                        "All plants are cared",
                        style: Styles.textGreen,
                      ),
                  ],
                ),
                // Adds new plant button.
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Styles.secondaryGreenColor,
                      context: context,
                      builder: (context) => CreationPage(),
                    );
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Styles.primaryGreenColor,
                      boxShadow: [
                        BoxShadow(
                          color: Styles.primaryGreenColor,
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/plus.svg",
                      color: Colors.white,
                      height: 19.5,
                      width: 19.5,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // Shows all garden.
      body: Center(
        child: ListView.builder(
            itemCount: plantsCounter,
            padding: EdgeInsets.only(top: 13),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(10),
                  child: get<HomeController>().careTodayPlantNeeded(
                          HomeController().getPlantsSortedByNextCare(
                              get<Plants>().getPlants())[index])
                      // Checks if plant needs care today and shows special design.
                      ? Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(17.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x33979797),
                                blurRadius: 20,
                              ),
                            ],
                            color: Styles.whiteColor,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(width: 22),
                                    // To plant page.
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => PlantPage(
                                                  plant: get<Plants>()
                                                      .getPlants()[index]))),
                                      // Plant avatar.
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x33979797),
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: CircleAvatar(
                                          radius: 34,
                                          backgroundImage: AssetImage(
                                              get<Plants>()
                                                  .getPlants()[index]
                                                  .getImagePath()),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // To plant page.
                                        GestureDetector(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PlantPage(
                                                            plant: get<Plants>()
                                                                    .getPlants()[
                                                                index]))),
                                            child: SizedBox(
                                              width: 201,
                                              child: AutoSizeText(
                                                get<Plants>()
                                                    .getPlants()[index]
                                                    .getName(),
                                                style: Styles.headLine1,
                                                maxLines: 1,
                                              ),
                                            )),
                                        // Shows what action need to do today.
                                        Text(
                                          "Need ${get<HomeController>().whatNeedToDoToday(get<Plants>().getPlants()[index])}",
                                          style: Styles.plantStatusBad,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                // Do care button.
                                GestureDetector(
                                  onTap: () {
                                    get<HomeController>().doCare(
                                        get<Plants>().getPlants()[index],
                                        get<AchievementController>(),
                                        get<Achievements>());
                                    setState(() {});
                                  },
                                  child: ClipPath(
                                    clipper: MyClipper(),
                                    child: Container(
                                      height: 100,
                                      width: 88,
                                      decoration: BoxDecoration(
                                          color: Styles.primaryGreenColor,
                                          borderRadius: BorderRadius.horizontal(
                                              right: Radius.circular(17.0))),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 33),
                                        child: SvgPicture.asset(
                                          "assets/icons/water_drop.svg",
                                          color: Colors.white,
                                          height: 34.0,
                                          width: 34.0,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        )
                      // Shows plants that don't need to be taken care of today.
                      : Opacity(
                          opacity: 0.8,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(17.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x33979797),
                                  blurRadius: 20,
                                ),
                              ],
                              color: Color.fromRGBO(252, 255, 248, 1),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 22),
                                      // To plant page.
                                      GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PlantPage(
                                                    plant: get<Plants>()
                                                        .getPlants()[index]))),
                                        // Plant avatar.
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x33979797),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                              ),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            radius: 34,
                                            backgroundImage: AssetImage(
                                                get<Plants>()
                                                    .getPlants()[index]
                                                    .getImagePath()),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // To plant page.
                                          GestureDetector(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          PlantPage(
                                                              plant: get<Plants>()
                                                                      .getPlants()[
                                                                  index]))),
                                              // Name of the plant with auto size.
                                              child: SizedBox(
                                                width: 201,
                                                child: AutoSizeText(
                                                  get<Plants>()
                                                      .getPlants()[index]
                                                      .getName(),
                                                  style: Styles.headLine1,
                                                  maxLines: 1,
                                                ),
                                              )),
                                          // Shows when the plant needs to be taken care of.
                                          Row(children: [
                                            Opacity(
                                                opacity: 0.6,
                                                child: Text(
                                                  "Next ${get<HomeController>().nextCare(get<Plants>().getPlants()[index])}",
                                                  style: Styles.plantStatusOk,
                                                )),
                                            Text(
                                              " in ${get<HomeController>().nextCareDays(get<Plants>().getPlants()[index])}",
                                              style: Styles.plantStatusOk,
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ));
            }),
      ),
    );
  }
}

/// Custom clipper for do care button.
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    ThirdOrderBezierCurveSection param = ThirdOrderBezierCurveSection(
      smooth: .7,
      p1: Offset(0, size.height),
      p2: Offset(64, 88.3),
      p3: Offset(6.5, -5.1),
      p4: Offset(62.5, 0),
    );
    ThirdOrderBezierCurveDots dots =
        ProsteThirdOrderBezierCurve.calcCurveDots(param);
    List<double> dotsList = dots.getList(); // Return to list<double>
    Map<String, double> dotsMap =
        dots.getMap(); // Return to Map<String, double>

    path.moveTo(62.5, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.cubicTo(dots.x1, dots.y1, dots.x2, dots.y2, dots.x3, dots.y3);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
