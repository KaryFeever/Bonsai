import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/utils/styles.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:bonsai/views/creation_page/widgets/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class CreationPage extends StatefulWidget {
  const CreationPage({super.key});

  @override
  State<CreationPage> createState() => _CreationPageState();
}

class _CreationPageState extends State<CreationPage> {
  final CreationController _controller = CreationController();

  @override
  Widget build(BuildContext context) {
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
                    onTap: () => Navigator.pop(context),
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
                ImagePicker(),

                /* PLANT NAME */
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: SizedBox(
                    height: 74,
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
                              height: 48,
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                    hintText: "Black Dahlia",
                                    hintStyle: Styles.inputText,
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
                                maxLines: 5,
                                showCursor: true,
                                cursorColor: Styles.textColorPrimary,
                                style: Styles.inputText,
                                decoration: InputDecoration(
                                    hintText:
                                        "The dahlia is a symbol of loyalty and happiness for your loved ones",
                                    hintStyle: Styles.inputText,
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
                        "Type of care",
                        style: Styles.headLineBottomSheet,
                      ),
                    ],
                  ),
                ),

                /* WATERING */
                CareConfiguration(
                  controller: _controller,
                  index: 0,
                  careType: "Watering",
                ),

                /* SPRAYING */
                CareConfiguration(
                  controller: _controller,
                  index: 1,
                  careType: "Spraying",
                ),

                /* FERTILIZING */
                CareConfiguration(
                  controller: _controller,
                  index: 2,
                  careType: "Fertilizing",
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
        ],
      ),
    );
  }
}
