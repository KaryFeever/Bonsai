import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

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
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Styles.secondaryGreenColor,
                context: context,
                builder: (context) => WateringTips(),
              );
            },
            child: Container(
                margin: EdgeInsets.only(top: 24, left: 25),
                height: 132,
                width: 325,
                decoration: BoxDecoration(
                  color: Styles.primaryGreenColor.withOpacity(0.20),
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
                      Text("How to water correctly",
                          style: Styles.careTipsText),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: SvgPicture.asset(
                        "assets/icons/drop_tips.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ])),
          ),
          Container(
              margin: EdgeInsets.only(top: 24, left: 25),
              height: 132,
              width: 325,
              decoration: BoxDecoration(
                color: Styles.primaryGreenColor.withOpacity(0.20),
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
                    margin: EdgeInsets.only(top: 20),
                    child: SvgPicture.asset(
                      "assets/icons/drop_tips.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ])),
          Container(
              margin: EdgeInsets.only(top: 24, left: 25),
              height: 132,
              width: 325,
              decoration: BoxDecoration(
                color: Styles.primaryGreenColor.withOpacity(0.20),
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
                    Container(
                      width: 192,
                      height: 32,
                      child: Text("How to fertilize correctly", //!! NEED TO FIX
                          style: Styles.careTipsText),
                    )
                    // Text("How to fertilize correctly",
                    //     style: Styles.careTipsText),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(top: 20), //!! NEED TO FIX
                    child: SvgPicture.asset(
                      "assets/icons/drop_tips.svg",
                      fit: BoxFit.scaleDown,
                    )),
              ])),
        ],
      ),
    );
  }
}

class WateringTips extends StatefulWidget with GetItStatefulWidgetMixin {
  WateringTips({super.key});

  @override
  State<WateringTips> createState() => _WateringTipsState();
}

class _WateringTipsState extends State<WateringTips> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.67,
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
                    "Watering tips",
                    style: Styles.headLine2,
                  ),
                  GestureDetector(
                    onTap: () {
                      get<CreationController>().cancel();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
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
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("How To Water Your Plants Correctly",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Knowing when and how to water potted plants is one of the most impactful and easiest ways "
                        "to ensure your plants thrive in your home.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #1: The plant’s pot matters",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Most plants you buy from other retailers come in grower pots. These pots are meant to be "
                        "temporary containers for your plants, not permanent homes. To keep your plants healthy, "
                        "they need pots that are the correct size for the size of the plant. The pots also need drainage "
                        "holes to help the soil dry out after watering and should be on a saucer to allow you to water "
                        "thoroughly and capture any excess water.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #2: Make sure it's time to water",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Rather than setting a strict water schedule, it’s better to pay attention to when the soil feels "
                        "dry. Make sure you use your finger or moisture meter to check a few inches below the topsoil, and "
                        "if you’re not detecting any moisture, then it’s time to water.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #3: Water the soil, not the leaves",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "It’s also important to avoid splashing the leaves when you water your plant. Make sure the spout "
                        "of your watering can is below the leaves and aimed only at the soil. This easy method helps prevent "
                        "bacterial infections, fungal infections, and other health issues.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #4: Water thoroughly and evenly",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Plant’s root systems mirror their foliage. If you only water one side, the roots and leaves will grow "
                        "towards the water that’s available on that side. To keep your plant full and lush, water evenly all "
                        "the way around the pot. Water thoroughly until water flows out the bottom of the pot into the saucer.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #5: Dump out any excess water",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Similar to how people don’t enjoy wet shoes or socks on their feet, plants also don’t like their roots "
                        "to be kept in overly wet soil. When a plant’s roots sit in saturated soil for too long, your plant will "
                        "eventually rot. After watering thoroughly, wait a few minutes till water runs out of the drainage hole "
                        "in the saucer, then discard any excess water to avoid having soggy soil and ‘wet feet.’",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                    top: 29.0,
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: Text("Tip #6: Consider the seasons",
                      style: Styles.headLine3),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      child: Text(
                        "Just like we tend to slow down in the winter, many plants will go dormant during the colder seasons by "
                        "conserving energy and stalling their growth. As a result, plants require far less water than they would "
                        "in the summer. This change in behavior makes it all the more important to learn the language of your "
                        "specific plant and to take time to understand when it’s actually in need of watering.",
                        style: Styles.textSecondary,
                        textAlign: TextAlign.justify,
                      ),
                    )),
                SizedBox(height: 21.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
