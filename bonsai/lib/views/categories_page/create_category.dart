/// View for the category creation page
/// Authors: Naumenko Maksim (xnaume01)
///          Vladyslav Kovalets (xkoval21)

import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:bonsai/controllers/categories_page/categories_controller.dart';
import '../../models/categories.dart';

class CreateCategory extends StatefulWidget with GetItStatefulWidgetMixin {
  CreateCategory({super.key});

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}

class _CreateCategoryState extends State<CreateCategory> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((CreationCategoryController x) => x.getSumbit());
    watchOnly((CreationCategoryController x) => x.careChanged());

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
                    "New category",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<CreationCategoryController>().cancel();
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
          SizedBox(
            height: 20,
          ),
          /* BODY */
          Expanded(
            child: ListView(
              children: [
                /* CATEGORY NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height:
                        get<CreationCategoryController>().validateName() == null
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
                              height: get<CreationCategoryController>()
                                          .validateName() ==
                                      null
                                  ? 48
                                  : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                showCursor: true,
                                controller: get<CreationCategoryController>()
                                    .getCategoryNameController(),
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                  errorText: get<CreationCategoryController>()
                                          .getSumbit()
                                      ? get<CreationCategoryController>()
                                          .validateName()
                                      : null,
                                  errorStyle:
                                      TextStyle(color: Styles.textOrange),
                                  hintText: "Cacti and Succulents",
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
                                controller: get<CreationCategoryController>()
                                    .getCategoryDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText: get<CreationCategoryController>()
                                            .getSumbit()
                                        ? get<CreationCategoryController>()
                                            .validateDescription()
                                        : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText:
                                        "Succulents store water in their leaves. They can survive quite a while without being watered.",
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
                        get<CreationCategoryController>().getSumbit()
                            ? get<CreationCategoryController>().validateCare()
                            : "Type of care",
                        style:
                            get<CreationCategoryController>().validateCare() ==
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
                  controller: get<CreationCategoryController>(),
                  mode: false,
                  isCategory: true,
                ),

                /* SPRAYING */
                CareConfiguration(
                  index: 1,
                  careType: "Spraying",
                  controller: get<CreationCategoryController>(),
                  mode: false,
                  isCategory: true,
                ),

                /* FERTILIZING */
                CareConfiguration(
                  index: 2,
                  careType: "Fertilizing",
                  controller: get<CreationCategoryController>(),
                  mode: false,
                  isCategory: true,
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
                get<CreationCategoryController>()
                    .createCategory(get<Categories>(), context);
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
