import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/main.dart';
import 'package:bonsai/views/creation_page/creation_page.dart';
import 'package:bonsai/views/plant_page/plant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import '../../models/plant.dart';
import '../../models/plants.dart';
import '../../constants/styles.dart';

class HomePage extends StatefulWidget with GetItStatefulWidgetMixin {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    int plants_counter = watchOnly((Plants x) => x.getPlantsCounter());
    return Scaffold(
      appBar: AppBar(
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
                Text(
                  "All plants watered",
                  style: Styles.textGreen,
                )
              ],
            ),
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
      body: Center(
        child: ListView.builder(
            itemCount: plants_counter,
            padding: EdgeInsets.only(top: 13),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(17.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x33979797),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Styles.whiteColor,
                  ),
                  child: Row(
                      // (круг с (именем и статусом)) и фигура
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 22),
                            Container(
                              // круг
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
                                backgroundColor: Styles.primaryGreenColor, //!!
                                // backgroundImage: AssetImage(
                                //     get<Plants>().getPlants()[index].getImagePath()),
                              ),
                            ),
                            SizedBox(width: 15),
                            Column(
                              // имя и статус
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //переход на страницу растения
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlantPage(
                                              plant: get<Plants>()
                                                  .getPlants()[index]))),
                                  child: Text(
                                    get<Plants>().getPlants()[index].getName(),
                                    style: Styles.headLine1,
                                  ),
                                ),
                                // имя

                                // статус
                                Text(
                                  // get<Plants>()
                                  //         .getPlants()[index]
                                  //         .getWateringStatus() ==
                                  // ? get<Plants>()
                                  //     .getPlants()[index]
                                  //     .getName()
                                  // : "empty",
                                  // get<Plants>().getPlants()[index].getName()? : "empty",
                                  "Need water!",
                                  style: Styles.plantStatusBad,
                                ),
                              ],
                            ),
                          ],
                        ),

                        // фигура
                        ClipPath(
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
                      ]),
                ),
              );
            }),
      ),
    );
  }
}

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

//  Text(
//         plant != null ? get<Plants>().getPlants()[0].getName() : "empty",
//       )