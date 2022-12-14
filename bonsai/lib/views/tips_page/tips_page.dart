/// View for the Care tips page
/// Author: Kovalets Vladyslav (xkoval21)
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../constants/styles.dart';

String typeOfTips = "";

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
              typeOfTips = "Watering";
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Styles.secondaryGreenColor,
                context: context,
                builder: (context) => WateringTips(),
              );
            },
            child: Container(
                margin: EdgeInsets.only(top: 24, left: 20),
                height: 132,
                width: MediaQuery.of(context).size.width - 40,
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
                      margin: EdgeInsets.only(top: 15, left: 50),
                      child: SvgPicture.asset(
                        "assets/icons/drop_tips.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ])),
          ),
          GestureDetector(
            onTap: () {
              typeOfTips = "Spraying";
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Styles.secondaryGreenColor,
                context: context,
                builder: (context) => WateringTips(),
              );
            },
            child: Container(
                margin: EdgeInsets.only(top: 24, left: 20),
                height: 132,
                width: MediaQuery.of(context).size.width - 40,
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
                      Text("How to spray correctly",
                          style: Styles.careTipsText),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, left: 52),
                      child: SvgPicture.asset(
                        "assets/icons/drop_tips.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ])),
          ),
          GestureDetector(
            onTap: () {
              typeOfTips = "Fertilizing";
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Styles.secondaryGreenColor,
                context: context,
                builder: (context) => WateringTips(),
              );
            },
            child: Container(
                margin: EdgeInsets.only(top: 24, left: 20),
                height: 132,
                width: MediaQuery.of(context).size.width - 40,
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
                      Text("How to fertilize correctly",
                          style: Styles.careTipsText),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 15, left: 37),
                      child: SvgPicture.asset(
                        "assets/icons/drop_tips.svg",
                        fit: BoxFit.scaleDown,
                      )),
                ])),
          ),
        ],
      ),
    );
  }
}

/// Counts the number of tips for the selected type of tips.
int tipsCount() {
  if (typeOfTips == "Watering") {
    return wateringTipsHeadings.length;
  } else if (typeOfTips == "Spraying") {
    return sprayingTipsHeadings.length;
  } else if (typeOfTips == "Fertilizing") {
    return fertilizingTipsHeadings.length;
  }
  return 0;
}

/// Returns the heading of the tip at the given index.
String getTextHeadings(int index) {
  if (typeOfTips == "Watering") {
    return wateringTipsHeadings[index];
  } else if (typeOfTips == "Spraying") {
    return sprayingTipsHeadings[index];
  } else if (typeOfTips == "Fertilizing") {
    return fertilizingTipsHeadings[index];
  }
  return "";
}

/// Returns the content of the tip at the given index.
String getTextContents(int index) {
  if (typeOfTips == "Watering") {
    return wateringTipsContents[index];
  } else if (typeOfTips == "Spraying") {
    return sprayingTipsContents[index];
  } else if (typeOfTips == "Fertilizing") {
    return fertilizingTipsContents[index];
  }
  return "";
}

/// Headings for the watering tips.
List<String> wateringTipsHeadings = [
  "How To Water Your Plants Correctly",
  "Tip #1: The plant’s pot matters",
  "Tip #2: Make sure it's time to water",
  "Tip #3: Water the soil, not the leaves",
  "Tip #4: Water thoroughly and evenly",
  "Tip #5: Dump out any excess water",
  "Tip #6: Consider the seasons",
];

/// Contents for the watering tips.
List<String> wateringTipsContents = [
  "Knowing when and how to water potted plants is one of the most impactful and easiest ways "
      "to ensure your plants thrive in your home.",
  "Most plants you buy from other retailers come in grower pots. These pots are meant to be "
      "temporary containers for your plants, not permanent homes. To keep your plants healthy, "
      "they need pots that are the correct size for the size of the plant. The pots also need drainage "
      "holes to help the soil dry out after watering and should be on a saucer to allow you to water "
      "thoroughly and capture any excess water.",
  "Rather than setting a strict water schedule, it’s better to pay attention to when the soil feels "
      "dry. Make sure you use your finger or moisture meter to check a few inches below the topsoil, and "
      "if you’re not detecting any moisture, then it’s time to water.",
  "It’s also important to avoid splashing the leaves when you water your plant. Make sure the spout "
      "of your watering can is below the leaves and aimed only at the soil. This easy method helps prevent "
      "bacterial infections, fungal infections, and other health issues.",
  "Plant’s root systems mirror their foliage. If you only water one side, the roots and leaves will grow "
      "towards the water that’s available on that side. To keep your plant full and lush, water evenly all "
      "the way around the pot. Water thoroughly until water flows out the bottom of the pot into the saucer.",
  "Similar to how people don’t enjoy wet shoes or socks on their feet, plants also don’t like their roots "
      "to be kept in overly wet soil. When a plant’s roots sit in saturated soil for too long, your plant will "
      "eventually rot. After watering thoroughly, wait a few minutes till water runs out of the drainage hole "
      "in the saucer, then discard any excess water to avoid having soggy soil and ‘wet feet.’",
  "Just like we tend to slow down in the winter, many plants will go dormant during the colder seasons by "
      "conserving energy and stalling their growth. As a result, plants require far less water than they would "
      "in the summer. This change in behavior makes it all the more important to learn the language of your "
      "specific plant and to take time to understand when it’s actually in need of watering.\n"
];

/// Headings for the spraying tips.
List<String> sprayingTipsHeadings = [
  "How Not To Harm Your Plants",
  "Tip #1: What plants need to be sprayed?",
  "Tip #2: What can be used?",
  "Tip #3: Day or night",
  "Tip #4: The correct sequence of actions",
  "Tip #5: Cold air",
  "Tip #6: When is enough?",
];

/// Contents for the spraying tips.
List<String> sprayingTipsContents = [
  "How, why and how to spray plants, and also take into account that not all indoor flowers require this procedure.",
  "Plants that need spraying are: native to the tropics, coniferous or have fleshy leaves painted bright green. \n"
      "Spraying is not necessary (and even fatal) for plants: with translucent, very thin leaves, with leaves whose "
      "surface is velvety or has a characteristic fluff.",
  "Water. Ideally, if it is spring or filtered, warm or room temperature. Remember that too hard or mineral water is dangerous for "
      "indoor flowers, because of it, salt spots form on the leaves.",
  "Spraying should be done before dark. The process of photosynthesis does not proceed without the participation of light. That is "
      "why the moisture that has fallen on the leaves of the plant at night will simply not be absorbed by them.",
  "First, the flower is watered, and only then sprayed. If you do the opposite, it is possible that in the process of watering you "
      "simply “miss” some kind of indoor flower, seeing that the surface of its earthy coma is wet.",
  "Spraying and cold air are incompatible. When spraying, be sure to make sure that the plant with wet leaves is not standing on a "
      "cold windowsill or, even more so, in a draft.",
  "Spraying the indoor flower should be done until water begins to drip from its leaves.\n",
];

/// Headings for the fertilizing tips.
List<String> fertilizingTipsHeadings = [
  "How To Fertilize Plants",
  "Tip #1: Types of Fertilizers",
  "Tip #2: Use Liquid Fertilizer",
  "Tip #3: Try Slow Release Fertilizer",
  "Tip #4: Follow The Instructions",
];

/// Contents for the fertilizing tips.
List<String> fertilizingTipsContents = [
  "Too many people overlook the importance of fertilizing indoor plants. However, proper feedings are essential to grow healthy, "
      "beautiful plants.",
  "Fertilizers come in several different varieties: liquids, sticks, tablets, granules, and slow-release forms.2 Of these, the two "
      "best suited for indoor use are liquid and slow-release fertilizers. Sticks and granules seem convenient, but they don't "
      "distribute nutrients very well through the soil. Granular fertilizers are designed for outdoor use.",
  "Liquid fertilizers are diluted into water and applied with a watering can. It provides a steady supply of nutrients that you can "
      "precisely control. It's easy to suspend feeding when the plant is dormant during the winter months, for example, or to increase "
      "feeding when the plant is sending up new growth.",
  "These products have quickly become favorites for many gardeners. Slow-release fertilizers are coated in time-release shells that "
      "slowly leach nutrients into the soil. The individual pellets have coatings of different thicknesses that dissolve at different "
      "rates. A single application can last between four and ninth months.",
  "Always follow the instructions on fertilizer labels. Too much fertilizer can kill a plant or scorch its leaves, and there are "
      "environmental concerns when fertilizers are overused because these nutrient-rich solutions find their way into groundwater "
      "supplies. Too much fertilizer is often worse than not enough, yet overfeeding is one of the most common mistakes made by "
      "well-meaning indoor gardeners. "
];

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
                  Text("$typeOfTips tips", style: Styles.headLine2),
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
            child: ListView.builder(
              itemCount: tipsCount(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(getTextHeadings(index),
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
                              getTextContents(index),
                              style: Styles.textSecondary,
                              // textAlign: TextAlign.justify, //? uncomment this line to justify text
                            ),
                          )),
                    ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
