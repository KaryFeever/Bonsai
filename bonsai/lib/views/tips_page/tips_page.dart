import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/styles.dart';

class TipsPage extends StatefulWidget {
  const TipsPage({super.key});

  @override
  State<TipsPage> createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        shadowColor: Color(0x33979797),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Care tips",
              style: Styles.headLine1,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 24, left: 25),
              height: 132,
              width: 325,
              decoration: BoxDecoration(
                color: Styles.primaryGreenColor
                    .withOpacity(0.20), //!! чт-то не так с цветом? :)
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(children: [
                SizedBox(width: 21.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 29.0),
                    Text(
                      "Watering",
                      style: Styles.headLine2,
                    ),
                    SizedBox(height: 8.0),
                    Text("How to water correctly", style: Styles.careTipsText),
                  ],
                ),
                Container(
                    // margin: EdgeInsets.only(left: 33),
                    child: SvgPicture.asset(
                  "assets/icons/drop_tips.svg",
                  color: Colors.black,
                  fit: BoxFit.scaleDown,
                )),
              ])),
          Container(
              margin: EdgeInsets.only(top: 24, left: 25),
              height: 132,
              width: 325,
              decoration: BoxDecoration(
                color: Styles.primaryGreenColor
                    .withOpacity(0.20), //!! чт-то не так с цветом? :)
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(children: [
                SizedBox(width: 21.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 29.0),
                    Text(
                      "Spraying",
                      style: Styles.headLine2,
                    ),
                    SizedBox(height: 8.0),
                    Text("How to spray correctly", style: Styles.careTipsText),
                  ],
                ),
                Container(
                    // margin: EdgeInsets.only(left: 33),
                    child: SvgPicture.asset(
                  "assets/icons/drop_tips.svg",
                  color: Colors.black,
                  fit: BoxFit.scaleDown,
                )),
              ])),
          Container(
              margin: EdgeInsets.only(top: 24, left: 25),
              height: 132,
              width: 325,
              decoration: BoxDecoration(
                color: Styles.primaryGreenColor
                    .withOpacity(0.20), //!! чт-то не так с цветом? :)
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(children: [
                SizedBox(width: 21.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 29.0),
                    Text(
                      "Fertilizing",
                      style: Styles.headLine2,
                    ),
                    SizedBox(height: 8.0),
                    Text("How to fertilize correctly",
                        style: Styles.careTipsText),
                  ],
                ),
                Container(
                    // margin: EdgeInsets.only(left: 33),
                    child: SvgPicture.asset(
                  "assets/icons/drop_tips.svg",
                  color: Colors.black,
                  fit: BoxFit.scaleDown,
                )),
              ])),
        ],
      ),
    );
  }
}
