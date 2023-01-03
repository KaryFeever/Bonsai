/// View for the plant page
/// Author: Naumenko Maksim (xnaume01)
import 'dart:io';
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/plant_page/plant_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../models/plant.dart';
import '../edit_page/edit_page.dart';

class PlantPage extends StatefulWidget with GetItStatefulWidgetMixin {
  PlantPage({required this.plant});
  Plant plant;
  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    int plant_changed = watchOnly((EditController x) => x.getChanged());
    int plant_care_changed = watchOnly((PlantController x) => x.getChanged());

    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment(0.0, -1.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.66,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: FileImage(File(widget.plant.getImagePath())),
              fit: BoxFit.cover,
            )),
          ),
        ),
        Align(
          alignment: Alignment(0.0, -0.8),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Styles.secondaryGreenColor,
                        context: context,
                        builder: (context) {
                          get<EditController>()
                              .initializeController(widget.plant);
                          return EditPage(
                            plant: widget.plant,
                          );
                        });
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                        color: Styles.whiteColor,
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
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.0, 1.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: get<PlantController>().getHeight(widget.plant),
            decoration: BoxDecoration(
              color: Styles.whiteColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 24.0,
                    bottom: 12.0,
                  ),
                  child: Text(
                    widget.plant.getName(),
                    style: Styles.headLine1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 40.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    widget.plant.getDescription(),
                    style: Styles.textPrimary,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  child: Divider(
                    color: Color(0x33979797),
                    thickness: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 22.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.d().format(DateTime.now()) +
                            " " +
                            DateFormat.MMM()
                                .format(DateTime.now())
                                .toLowerCase() +
                            ".",
                        style: Styles.plantPageDate,
                      ),
                      // Container(
                      //   height: 52,
                      //   width: 52,
                      //   decoration: BoxDecoration(
                      //     color: Styles.buttonBackgroundSecondaryGreen,
                      //     borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      //     border: Border.all(
                      //       color: Styles.buttonBackgroundSecondaryGreen,
                      //       width: 1,
                      //     ),
                      //   ),
                      //   child: SizedBox(
                      //     height: 26,
                      //     width: 26,
                      //     child: SvgPicture.asset(
                      //       "assets/icons/calendar.svg",
                      //       fit: BoxFit.scaleDown,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 21.0,
                  ),
                  child: get<PlantController>().wateringEnabled(widget.plant)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Need watering",
                                  style: Styles.plantPageCareHeadline,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: get<PlantController>()
                                              .wateringNeeded(widget.plant)
                                          ? "Next care "
                                          : "Next care in ",
                                      style: Styles.plantPageNextCareText,
                                      children: [
                                        TextSpan(
                                            text: get<PlantController>()
                                                    .wateringNeeded(
                                                        widget.plant)
                                                ? 'Today'
                                                : get<PlantController>()
                                                    .wateringNextCareDays(
                                                        widget.plant),
                                            style: get<PlantController>()
                                                    .wateringNeeded(
                                                        widget.plant)
                                                ? Styles.plantPageNextCareToday
                                                : Styles
                                                    .plantPageNextCareDays) //Styles.plantPageNextCareToday)
                                      ]),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (get<PlantController>()
                                    .wateringNeeded(widget.plant)) {
                                  get<PlantController>().water(widget.plant);
                                  get<AchievementController>()
                                      .updateWatering(get<Achievements>());
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: get<PlantController>()
                                          .wateringNeeded(widget.plant)
                                      ? Styles.primaryGreenColor
                                      : Styles.buttonBackgroundSecondaryGreen,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      get<PlantController>()
                                              .wateringNeeded(widget.plant)
                                          ? "Water"
                                          : "Done",
                                      style: get<PlantController>()
                                              .wateringNeeded(widget.plant)
                                          ? Styles.buttonText
                                          : Styles.buttonTextSecondaryGreen,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 21.0,
                  ),
                  child: get<PlantController>().sprayingEnabled(widget.plant)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Need spraying",
                                  style: Styles.plantPageCareHeadline,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: get<PlantController>()
                                              .sprayingNeeded(widget.plant)
                                          ? "Next care "
                                          : "Next care in ",
                                      style: Styles.plantPageNextCareText,
                                      children: [
                                        TextSpan(
                                            text: get<PlantController>()
                                                    .sprayingNeeded(
                                                        widget.plant)
                                                ? 'Today'
                                                : get<PlantController>()
                                                    .sprayingNextCareDays(
                                                        widget.plant),
                                            style: get<PlantController>()
                                                    .sprayingNeeded(
                                                        widget.plant)
                                                ? Styles.plantPageNextCareToday
                                                : Styles
                                                    .plantPageNextCareDays) //Styles.plantPageNextCareToday)
                                      ]),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (get<PlantController>()
                                    .sprayingNeeded(widget.plant)) {
                                  get<PlantController>().spray(widget.plant);
                                  get<AchievementController>()
                                      .updateSpraying(get<Achievements>());
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: get<PlantController>()
                                          .sprayingNeeded(widget.plant)
                                      ? Styles.primaryGreenColor
                                      : Styles.buttonBackgroundSecondaryGreen,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      get<PlantController>()
                                              .sprayingNeeded(widget.plant)
                                          ? "Spray"
                                          : "Done",
                                      style: get<PlantController>()
                                              .sprayingNeeded(widget.plant)
                                          ? Styles.buttonText
                                          : Styles.buttonTextSecondaryGreen,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : null,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 21.0,
                  ),
                  child: get<PlantController>().fertilizingEnabled(widget.plant)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Need fertilizing",
                                  style: Styles.plantPageCareHeadline,
                                ),
                                RichText(
                                  text: TextSpan(
                                      text: get<PlantController>()
                                              .fertilizingNeeded(widget.plant)
                                          ? "Next care "
                                          : "Next care in ",
                                      style: Styles.plantPageNextCareText,
                                      children: [
                                        TextSpan(
                                            text: get<PlantController>()
                                                    .fertilizingNeeded(
                                                        widget.plant)
                                                ? 'Today'
                                                : get<PlantController>()
                                                    .fertilizingNextCareDays(
                                                        widget.plant),
                                            style: get<PlantController>()
                                                    .fertilizingNeeded(
                                                        widget.plant)
                                                ? Styles.plantPageNextCareToday
                                                : Styles
                                                    .plantPageNextCareDays) //Styles.plantPageNextCareToday)
                                      ]),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (get<PlantController>()
                                    .fertilizingNeeded(widget.plant)) {
                                  get<PlantController>()
                                      .fertilize(widget.plant);
                                  get<AchievementController>()
                                      .updateFertilizng(get<Achievements>());
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: get<PlantController>()
                                          .fertilizingNeeded(widget.plant)
                                      ? Styles.primaryGreenColor
                                      : Styles.buttonBackgroundSecondaryGreen,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      get<PlantController>()
                                              .fertilizingNeeded(widget.plant)
                                          ? "Fertilize"
                                          : "Done",
                                      style: get<PlantController>()
                                              .fertilizingNeeded(widget.plant)
                                          ? Styles.buttonText
                                          : Styles.buttonTextSecondaryGreen,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
