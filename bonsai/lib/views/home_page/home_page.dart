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
                  child: Center(
                    //add circle avatar here with image

                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 21.0),
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
                      Padding(padding: EdgeInsets.only(left: 15.0)),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlantPage(
                                    plant: get<Plants>().getPlants()[index]))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                get<Plants>().getPlants()[index].getName(),
                                style: Styles.headLine1,
                              ),
                              //? сделать расстояние между текстом меньше
                              Text(
                                "Need water!",
                                style: Styles.plantStatusBad,
                              ),
                            ]),
                      ),
                      Container(
                        //фигура справа
                        margin: EdgeInsets.only(left: 79.0),
                        height: 100,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Styles.primaryGreenColor,
                          borderRadius: BorderRadius.all(Radius.circular(17.0)),
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

//  Text(
//         plant != null ? get<Plants>().getPlants()[0].getName() : "empty",
//       )