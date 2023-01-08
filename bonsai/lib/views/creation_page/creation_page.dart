/// View for the plant creation page
/// Authors:
///         Naumenko Maksim (xnaume01)
///         Vladyslav Kovalets (xkoval21)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/views/categories_page/create_category.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:bonsai/views/creation_page/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../controllers/categories_page/categories_controller.dart';

class CreationPage extends StatefulWidget with GetItStatefulWidgetMixin {
  CreationPage({super.key});

  @override
  State<CreationPage> createState() => _CreationPageState();
}

String selectedValue = Styles.notSelected;

class _CreationPageState extends State<CreationPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((CreationController x) => x.getSumbit());
    watchOnly((CreationController x) => x.careChanged());

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
                    "New plant",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<CreationController>().cancel();
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
                  image_path: get<CreationController>().getImagePath(),
                  controller: get<CreationController>(),
                  plant: true,
                ),

                /* PLANT NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height: get<CreationController>().validateName() == null
                        ? 74
                        : 90,
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
                                  get<CreationController>().validateName() ==
                                          null
                                      ? 48
                                      : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                showCursor: true,
                                controller: get<CreationController>()
                                    .getPlantNameController(),
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                  errorText: get<CreationController>()
                                          .getSumbit()
                                      ? get<CreationController>().validateName()
                                      : null,
                                  errorStyle:
                                      TextStyle(color: Styles.textOrange),
                                  hintText: "Black Dahlia",
                                  hintStyle: Styles.hintText,
                                  filled: true,
                                  fillColor: Styles.fieldsBackgroundColor,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  contentPadding: EdgeInsets.only(
                                    bottom: 48 / 2,
                                    left: 12,
                                    right: 12,
                                  ),
                                ),
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
                                controller: get<CreationController>()
                                    .getPlantDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText:
                                        get<CreationController>().getSumbit()
                                            ? get<CreationController>()
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
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Category",
                        style: Styles.headLineBottomSheet,
                      ),

                      /* Button to edit the categories */
                      Padding(
                        padding: EdgeInsets.only(
                          left: 250.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Styles.secondaryGreenColor,
                              context: context,
                              builder: (context) => CreateCategory(),
                            );
                          },
                          child: Container(
                            height: 20,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: Styles.fieldsBackgroundColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Styles.primaryGreenColor,
                              //     blurRadius: 1,
                              //     spreadRadius: 1,
                              //   ),
                              // ],
                            ),
                            child: Center(
                              child: Text("New",
                                  style: Styles.headLineBottomSheet),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                /* DROPDOWN LIST */
                Padding(
                    padding: EdgeInsets.only(
                      bottom: 6.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: DropdownButton(
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: get<CreationCategoryController>()
                            .dropdownItems(get<Categories>()))),

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
                        get<CreationController>().getSumbit()
                            ? get<CreationController>()
                                .validateCare(selectedValue)
                            : "Type of care",
                        style: get<CreationController>()
                                    .validateCare(selectedValue) ==
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
                  controller: get<CreationController>(),
                  mode: false,
                  isCategory: false,
                ),

                /* SPRAYING */
                CareConfiguration(
                  index: 1,
                  careType: "Spraying",
                  controller: get<CreationController>(),
                  mode: false,
                  isCategory: false,
                ),

                /* FERTILIZING */
                CareConfiguration(
                  index: 2,
                  careType: "Fertilizing",
                  controller: get<CreationController>(),
                  mode: false,
                  isCategory: false,
                ),
              ],
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
                get<CreationController>().createPlant(
                    get<Plants>(),
                    context,
                    selectedValue,
                    get<Categories>(),
                    get<AchievementController>(),
                    get<Achievements>());
                get<AchievementController>().updatePlantsAchievements(
                    get<Achievements>(), get<Plants>());
                selectedValue = Styles.notSelected;
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
                        "Create",
                        style: Styles.buttonText,
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
