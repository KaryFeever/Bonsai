/// View for the plant creation page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:bonsai/controllers/creation_page/group_creation_controller.dart';
import 'package:bonsai/models/achievement_list.dart';
import 'package:bonsai/models/groups.dart';
import 'package:bonsai/models/plants.dart';
import 'package:bonsai/constants/styles.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:bonsai/views/creation_page/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class GroupCreationPage extends StatefulWidget with GetItStatefulWidgetMixin {
  GroupCreationPage({super.key});

  @override
  State<GroupCreationPage> createState() => _GroupCreationPageState();
}

class _GroupCreationPageState extends State<GroupCreationPage>
    with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((GroupCreationController x) => x.getSumbit());

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
                    "New group",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<GroupCreationController>().cancel();
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
                  image_path: get<GroupCreationController>().getImagePath(),
                  controller: get<GroupCreationController>(),
                  plant: false,
                ),

                /* GROUP NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height:
                        get<GroupCreationController>().validateName() == null
                            ? 74
                            : 90,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Group name",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height: get<GroupCreationController>()
                                          .validateName() ==
                                      null
                                  ? 48
                                  : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                showCursor: true,
                                controller: get<GroupCreationController>()
                                    .getGroupNameController(),
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                  errorText:
                                      get<GroupCreationController>().getSumbit()
                                          ? get<GroupCreationController>()
                                              .validateName()
                                          : null,
                                  errorStyle:
                                      TextStyle(color: Styles.textOrange),
                                  hintText: "In livingroom",
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

                /* GROUP DESCRIPTION */
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
                              "Description (optional)",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height: 96,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                controller: get<GroupCreationController>()
                                    .getGroupDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText: get<GroupCreationController>()
                                            .getSumbit()
                                        ? get<GroupCreationController>()
                                            .validateDescription()
                                        : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText:
                                        "Group for plants in the livingroom",
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

                /* GROUP DISPLACEMENT */
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
                              "Place (optional)",
                              style: Styles.headLineBottomSheet,
                            ),
                            SizedBox(
                              height: 96,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                controller: get<GroupCreationController>()
                                    .getGroupPlaceController(),
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText: get<GroupCreationController>()
                                            .getSumbit()
                                        ? get<GroupCreationController>()
                                            .validatePlace()
                                        : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText:
                                        "Stefanikova 34, flat c.23, livingroom",
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
                get<GroupCreationController>()
                    .createGroup(get<Groups>(), context);
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
