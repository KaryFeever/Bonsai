/// View for the plant edit page
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/categories_page/categories_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/views/categories_page/create_category.dart';
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

String selectedValue = Styles.notSelected;
bool selected = false;

class _EditPageeState extends State<EditPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((EditController x) => x.getSumbit());
    if (widget.plant.getPlantCategory().getName() != "" && !selected) {
      selectedValue = widget.plant.getPlantCategory().getName();
    }

    // widget.plant.getPlantCategory().getName() == ""
    //     ? selectedValue
    //     : widget.plant.getPlantCategory().getName(),

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
                      selected = false;
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
                        // widget.plant.getPlantCategory().getName() == ""
                        //     ? selectedValue
                        //     : widget.plant.getPlantCategory().getName(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                            selected = true;
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
                  isCategory: false,
                ),

                /* SPRAYING */
                CareConfiguration(
                  index: 1,
                  careType: "Spraying",
                  controller: get<EditController>(),
                  mode: true,
                  isCategory: false,
                ),

                /* FERTILIZING */
                CareConfiguration(
                  index: 2,
                  careType: "Fertilizing",
                  controller: get<EditController>(),
                  mode: true,
                  isCategory: false,
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
