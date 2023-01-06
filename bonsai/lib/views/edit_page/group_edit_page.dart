/// View for the plant edit page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:bonsai/controllers/edit_page/group_edit_controller.dart';
import 'package:bonsai/models/group.dart';
import 'package:bonsai/models/groups.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../../models/plant.dart';
import '../../models/plants.dart';
import '../creation_page/widgets/care_configuration.dart';
import '../creation_page/widgets/image_picker.dart';

class GroupEditPage extends StatefulWidget with GetItStatefulWidgetMixin {
  GroupEditPage({required this.group});
  Group group;
  @override
  State<GroupEditPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupEditPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((GroupEditController x) => x.getSumbit());
    watchOnly((GroupEditController x) => x.getChanges());
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
                    "Edit group",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<GroupEditController>()
                          .initializeController(widget.group);
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
                  image_path: get<GroupEditController>().getImagePath(),
                  controller: get<GroupEditController>(),
                ),

                /* GROUP NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height: get<GroupEditController>().validateName() == null
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
                              height:
                                  get<EditController>().validateName() == null
                                      ? 48
                                      : 70,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                onChanged: (text) => setState(() {}),
                                controller: get<GroupEditController>()
                                    .getGroupNameController(),
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                    errorText:
                                        get<GroupEditController>().getSumbit()
                                            ? get<GroupEditController>()
                                                .validateName()
                                            : null,
                                    errorStyle:
                                        TextStyle(color: Styles.textOrange),
                                    hintText: "In Livingroom",
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
                                controller: get<GroupEditController>()
                                    .getGroupDescriptionController(),
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                onChanged: (string) => setState(() {}),
                                decoration: InputDecoration(
                                    errorText:
                                        get<GroupEditController>().getSumbit()
                                            ? get<GroupEditController>()
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
                get<GroupEditController>().saveChanges(
                  widget.group,
                  context,
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
                get<GroupEditController>()
                    .deleteGroup(get<Groups>(), widget.group);
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
                        "Delete group",
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
