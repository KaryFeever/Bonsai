/// View for the edit categories page
/// Authors: Naumenko Maksim (xnaume01)
///          Vladyslav Kovalets (xkoval21)

import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/edit_category_page/edit_category_controller.dart';
import 'package:bonsai/models/categories.dart';
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/views/categories_page/edit_category.dart';
import 'package:bonsai/controllers/categories_page/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class EditCategories extends StatefulWidget with GetItStatefulWidgetMixin {
  EditCategories({super.key});

  @override
  State<EditCategories> createState() => _EditCategoriesState();
}

class _EditCategoriesState extends State<EditCategories> with GetItStateMixin {
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
                    "Your categories",
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
          SizedBox(
            height: 10,
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
                      height: 650,
                      child: Center(
                        child: ListView.builder(
                          itemCount: get<Categories>().getCategoriesCounter(),
                          padding: EdgeInsets.only(top: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                padding: EdgeInsets.all(10),
                                child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor:
                                              Styles.secondaryGreenColor,
                                          context: context,
                                          builder: (context) {
                                            get<EditCategoryController>()
                                                .initializeController(
                                                    get<Categories>()
                                                        .getCategories()
                                                        .elementAt(index));
                                            return EditCategoryPage(
                                              category: get<Categories>()
                                                  .getCategories()
                                                  .elementAt(index),
                                            );
                                          });
                                    },
                                    child: Column(children: [
                                      Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            color: Styles.achievementLocked,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 16),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // SizedBox(
                                                  //   height: 24,
                                                  //   width: 24,
                                                  //   child: SvgPicture.asset(
                                                  //     "assets/icons/category-icon.svg",
                                                  //     color: Styles.primaryGreenColor,
                                                  //     fit: BoxFit.scaleDown,
                                                  //   ),
                                                  // ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      get<Categories>()
                                                          .getCategories()
                                                          .elementAt(index)
                                                          .getName(),
                                                      style:
                                                          Styles.settingsHeader,
                                                    ),
                                                  ),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5),
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          get<Categories>().removeCategory(
                                                              get<Categories>()
                                                                  .getCategories()
                                                                  .elementAt(
                                                                      index)
                                                                  .getName(),
                                                              get<Plants>()
                                                                  .getPlants());
                                                          //refresh
                                                          setState(() {});
                                                        },
                                                        child: SvgPicture.asset(
                                                          "assets/icons/delete.svg",
                                                          color:
                                                              Styles.textOrange,
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ))
                                                ]),
                                          )),
                                      Container(
                                        height:
                                            get<CreationCategoryController>()
                                                .setHeightOfDescriptionField(
                                                    get<Categories>()
                                                        .getCategories()
                                                        .elementAt(index)),
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight:
                                                  Radius.circular(8.0)),
                                          color: Styles.fieldsBackgroundColor,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 16),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Text(
                                              get<Categories>()
                                                  .getCategories()
                                                  .elementAt(index)
                                                  .getDescription(),
                                              style: Styles.textSecondary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ])));
                          },
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
