/// View for the edit category page
/// Authors: Naumenko Maksim (xnaume01)
///          Vladyslav Kovalets (xkoval21)

import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/controllers/edit_category_page/edit_category_controller.dart';
import 'package:bonsai/models/category.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class EditCategoryPage extends StatefulWidget with GetItStatefulWidgetMixin {
  EditCategoryPage({required this.category});
  Category category;

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage>
    with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((EditCategoryController x) => x.getSumbit());
    watchOnly((EditCategoryController x) => x.careChanged());
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
                    "Edit category",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<EditCategoryController>()
                          .initializeController(widget.category);
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
                /* CATEGORY NAME */
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height: get<EditCategoryController>().validateName() == null
                        ? 74
                        : 90,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Category name",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height: get<EditCategoryController>()
                                          .validateName() ==
                                      null
                                  ? 48
                                  : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                controller: get<EditCategoryController>()
                                    .getCategoryNameController(),
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                    errorText: get<EditCategoryController>()
                                            .getSumbit()
                                        ? get<EditCategoryController>()
                                            .validateName()
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

                /* CATEGORY DESCRIPTION */
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
                                controller: get<EditCategoryController>()
                                    .getCategoryDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText: get<EditCategoryController>()
                                            .getSumbit()
                                        ? get<EditCategoryController>()
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
                        get<EditCategoryController>().getSumbit()
                            ? get<EditCategoryController>().validateCare()
                            : "Type of care",
                        style: get<EditCategoryController>().validateCare() ==
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
                  controller: get<EditCategoryController>(),
                  mode: true,
                  isCategory: true,
                ),

                /* SPRAYING */
                CareConfiguration(
                  index: 1,
                  careType: "Spraying",
                  controller: get<EditCategoryController>(),
                  mode: true,
                  isCategory: true,
                ),

                /* FERTILIZING */
                CareConfiguration(
                  index: 2,
                  careType: "Fertilizing",
                  controller: get<EditCategoryController>(),
                  mode: true,
                  isCategory: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: 25.0,
            ),
            child: GestureDetector(
              onTap: () {
                get<EditCategoryController>().saveChanges(
                  widget.category,
                  context,
                  get<Plants>().getPlants(),
                );
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
        ],
      ),
    );
  }
}
