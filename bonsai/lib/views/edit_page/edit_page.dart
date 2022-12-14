import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../models/plant.dart';
import '../../models/plants.dart';
import '../creation_page/widgets/care_configuration.dart';
import '../creation_page/widgets/image_picker.dart';

class EditPage extends StatefulWidget with GetItStatefulWidgetMixin {
  EditPage({required this.plant});
  Plant plant;
  @override
  State<EditPage> createState() => _EditPageeState();
}

class _EditPageeState extends State<EditPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((EditController x) => x.getSumbit());
    watchOnly((EditController x) => x.careChanged());
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: Color(0x33979797),
                    thickness: 4,
                  ),
                )
              ],
            ),
          ),

          /* HEADER */
          Padding(
            padding: EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: SizedBox(
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Edit plant",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<EditController>().initializeController(widget.plant);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: Styles.bottomSheetCloseText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 1,
                child: Divider(
                  color: Color(0x33979797),
                  thickness: 2,
                ),
              )
            ],
          ),

          /* BODY */
          Expanded(
            child: ListView(
              children: [
                /* IMAGE */
                ImagePicker(
                  image_path: get<EditController>().getImagePath(),
                  controller: get<EditController>(),
                ),

                /* PLANT NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height:
                        get<EditController>().validateName() == null ? 74 : 90,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Plant name",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height:
                                  get<EditController>().validateName() == null
                                      ? 48
                                      : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                controller: get<EditController>()
                                    .getPlantNameController(),
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                    errorText: get<EditController>().getSumbit()
                                        ? get<EditController>().validateName()
                                        : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText: "Black Dahlia",
                                    hintStyle: Styles.hintText,
                                    filled: true,
                                    fillColor: Styles.fieldsBackgroundColor,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    contentPadding: EdgeInsets.only(
                                      bottom: 48 / 2,
                                      left: 12,
                                      right: 12,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /* PLANT DESCRIPTION */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height: 122,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Description",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height: 96,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                controller: get<EditController>()
                                    .getPlantDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText: get<EditController>().getSumbit()
                                        ? get<EditController>()
                                            .validateDescription()
                                        : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText:
                                        "The dahlia is a symbol of loyalty and happiness for your loved ones",
                                    hintStyle: Styles.hintText,
                                    filled: true,
                                    fillColor: Styles.fieldsBackgroundColor,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    contentPadding: EdgeInsets.only(
                                      bottom: 48 / 2,
                                      left: 12,
                                      right: 12,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                /* TYPES OF CARE */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 6.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        get<EditController>().getSumbit()
                            ? get<EditController>().validateCare()
                            : "Type of care",
                        style: get<EditController>().validateCare() ==
                                "Type of care"
                            ? Styles.headLineBottomSheet
                            : Styles.headLineBottomSheetError,
                      ),
                    ],
                  ),
                ),

                /* WATERING */
                CareConfiguration(
                  index: 0,
                  careType: "Watering",
                  controller: get<EditController>(),
                  mode: true,
                ),

                /* SPRAYING */
                CareConfiguration(
                  index: 1,
                  careType: "Spraying",
                  controller: get<EditController>(),
                  mode: true,
                ),

                /* FERTILIZING */
                CareConfiguration(
                  index: 2,
                  careType: "Fertilizing",
                  controller: get<EditController>(),
                  mode: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 12.0,
            ),
            child: GestureDetector(
              onTap: () {
                get<EditController>().saveChanges(widget.plant, context,
                    get<AchievementController>(), get<Achievements>());
              },
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
                      "Save",
                      style: Styles.buttonText,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                get<EditController>().deletePlant(get<Plants>(), widget.plant);
                get<AchievementController>()
                    .unlockDeletedAchievement(get<Achievements>());
              },
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Styles.secondaryOrangeColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delete plant",
                        style: Styles.buttonTextOrange,
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
