/// View for the plant page
/// Author: Mikhailov Kirill (xmikha00)
import 'dart:io';
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/home_page/home_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/edit_page/group_edit_controller.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/views/edit_page/group_edit_page.dart';
import 'package:flutter/material.dart';
import 'package:bonsai/views/plant_page/plant_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:intl/intl.dart';
import '../../models/group.dart';
import '../../models/plant.dart';
import '../../models/plants.dart';
import '../edit_page/edit_page.dart';

class GroupPage extends StatefulWidget with GetItStatefulWidgetMixin {
  GroupPage({required this.group});
  Group group;
  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((GroupEditController x) => x.getChanges());

    List<bool?> potentialPlants = [];
    for (int i = 0; i < get<Plants>().getPlantsCounter(); i++) {
      if (widget.group.getPlantFromList(get<Plants>().getPlants()[i].getName()))
        potentialPlants.add(true);
      else
        potentialPlants.add(false);
    }

    return Scaffold(
        body: Stack(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 25, top: 65),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Styles.whiteColor,
                      border:
                          Border.all(color: Styles.primaryGreenColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: SizedBox(
                      height: 26,
                      width: 26,
                      child: SvgPicture.asset(
                        "assets/icons/arrow_left.svg",
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(right: 25, top: 65),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Styles.secondaryGreenColor,
                  context: context,
                  builder: (context) {
                    return GroupEditPage(
                      group: widget.group,
                    );
                  });
            },
            child: Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                  color: Styles.whiteColor,
                  border: Border.all(color: Styles.primaryGreenColor, width: 3),
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: SizedBox(
                height: 26,
                width: 26,
                child: SvgPicture.asset(
                  "assets/icons/setting.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: 130),
          child: Container(
              height: (widget.group.getDescription() != "" &&
                      widget.group.getPlace() == "")
                  ? 200
                  : (widget.group.getDescription() != "" &&
                          widget.group.getPlace() != "")
                      ? 260
                      : (widget.group.getDescription() == "" &&
                              widget.group.getPlace() != "")
                          ? 150
                          : 100,
              width: MediaQuery.of(context).size.width - 50,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Color(0x33979797), blurRadius: 60)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Styles.whiteColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 0, top: 25),
                    child: Text(
                      widget.group.getName(),
                      style: Styles.headLine1,
                    ),
                  ),
                  (widget.group.getDescription() != "")
                      ? Padding(
                          padding: EdgeInsets.only(left: 25, top: 10),
                          child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Description: ",
                                  style: Styles.rankLeftOfBold,
                                ),
                              ]),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                  (widget.group.getDescription() != "")
                      ? Padding(
                          padding: EdgeInsets.only(left: 45),
                          child: Row(children: [
                            SizedBox(
                              width: 300,
                              height: 75,
                              child: Text(
                                widget.group.getDescription(),
                                style: Styles.rankLeftOfBold,
                              ),
                            )
                          ]),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                  (widget.group.getPlace() != "")
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Displacement: ",
                                  style: Styles.rankLeftOfBold,
                                ),
                              ]),
                        )
                      : SizedBox(
                          width: 0,
                        ),
                  (widget.group.getPlace() != "")
                      ? Padding(
                          padding: EdgeInsets.only(left: 45),
                          child: Row(children: [
                            SizedBox(
                              width: 300,
                              height: 53,
                              child: Text(
                                widget.group.getPlace(),
                                style: Styles.rankLeftOfBold,
                              ),
                            )
                          ]),
                        )
                      : SizedBox(
                          width: 0,
                        )
                ],
              )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: (widget.group.getDescription() != "" &&
                    widget.group.getPlace() == "")
                ? 340
                : (widget.group.getDescription() != "" &&
                        widget.group.getPlace() != "")
                    ? 405
                    : (widget.group.getDescription() == "" &&
                            widget.group.getPlace() != "")
                        ? 290
                        : 240,
            left: 25),
        child: Text(
          "Plants in group :",
          style: Styles.headLine3,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: (widget.group.getDescription() != "" &&
                  widget.group.getPlace() == "")
              ? 280
              : (widget.group.getDescription() != "" &&
                      widget.group.getPlace() != "")
                  ? 335
                  : (widget.group.getDescription() == "" &&
                          widget.group.getPlace() != "")
                      ? 250
                      : 180,
        ),
        child: Center(
            child: Container(
          height: (widget.group.getDescription() != "" &&
                  widget.group.getPlace() == "")
              ? 440
              : (widget.group.getDescription() != "" &&
                      widget.group.getPlace() != "")
                  ? 350
                  : (widget.group.getDescription() == "" &&
                          widget.group.getPlace() != "")
                      ? 470
                      : 540,
          child: ListView.builder(
              itemCount: widget.group.getCountOfAttachedPlants(),
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
                                              plant: widget.group
                                                  .getPlantList()[index]))),
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
                                      backgroundImage: AssetImage(widget.group
                                          .getPlantList()[index]
                                          .getImagePath()),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // To plant page.
                                    GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => PlantPage(
                                                    plant: widget.group
                                                            .getPlantList()[
                                                        index]))),
                                        child: SizedBox(
                                          width: 201,
                                          child: AutoSizeText(
                                            widget.group
                                                .getPlantList()[index]
                                                .getName(),
                                            style: Styles.headLine1,
                                            maxLines: 1,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    ));
              }),
        )),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: false,
                backgroundColor: Styles.secondaryGreenColor,
                context: context,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text("Plants", style: Styles.headLine2)],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 40, top: 70),
                          child: Container(
                            height: 400,
                            child: ListView.builder(
                              itemCount: get<Plants>().getPlantsCounter(),
                              padding: EdgeInsets.only(top: 13),
                              itemBuilder: (BuildContext context, int index) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        top: index == 0 ? 70 : 10,
                                        left: 10,
                                        right: 10,
                                        bottom: index ==
                                                (get<Plants>()
                                                        .getPlantsCounter() -
                                                    1)
                                            ? 50
                                            : 10),
                                    child: CheckboxListTile(
                                      title: Text(
                                        get<Plants>()
                                            .getPlants()[index]
                                            .getName(),
                                        style: Styles.headLine3,
                                      ),
                                      value: potentialPlants[index],
                                      onChanged: (val) {
                                        setState(() {
                                          potentialPlants[index] = val;
                                        });
                                      },
                                    ),
                                  );
                                });
                              },
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 12.0,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              get<GroupEditController>().updateGroup(
                                  get<Plants>(), widget.group, potentialPlants);
                            },
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width - 40,
                                decoration: BoxDecoration(
                                  color: Styles.primaryGreenColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Update group",
                                      style: Styles.buttonText,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ]),
                  );
                });
          },
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  color: Styles.primaryGreenColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add/Delete plant",
                      style: Styles.buttonText,
                    ),
                  ],
                )),
          ),
        ),
      ),
    ]));
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
