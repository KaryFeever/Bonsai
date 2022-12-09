import 'dart:io';

import 'package:bonsai/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/plant.dart';
import '../edit_page/edit_page.dart';

class PlantPage extends StatefulWidget {
  PlantPage({required this.plant});
  Plant plant;
  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment(0.0, -1.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
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
                      builder: (context) => EditPage(
                        plant: widget.plant,
                      ),
                    );
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
            height: 400,
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
                        "08 oct.",
                        style: Styles.plantPageDate,
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Styles.buttonBackgroundSecondaryGreen,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          border: Border.all(
                            color: Styles.buttonBackgroundSecondaryGreen,
                            width: 1,
                          ),
                        ),
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: SvgPicture.asset(
                            "assets/icons/calendar.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
