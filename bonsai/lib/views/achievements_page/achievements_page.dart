/// View for the Achievements page
/// Author: Mikhailov Kirill (xmikha00)
import 'package:bonsai/controllers/achievements_page/achievement_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../models/achievement_list.dart';
import '../../constants/styles.dart';

class AchievementsPage extends StatefulWidget with GetItStatefulWidgetMixin {
  AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage>
    with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    watchOnly((AchievementController x) => x.getViewSetting());
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey.shade50,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Achievements",
                style: Styles.headLine1,
              )
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 37),
          child: Column(
            children: [
              Container(
                  height: 160,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      color: Styles.secondaryGreenColor),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 0, top: 25),
                        child: Text(
                          "Your rank",
                          style: Styles.headLine2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 0, top: 0),
                        child: Text(
                          get<AchievementController>()
                              .getRank(get<Achievements>()),
                          style: Styles.rankText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 0, top: 16),
                        child: Row(
                          children: [
                            Text(
                              get<AchievementController>()
                                  .leftToNextRank(get<Achievements>()),
                              style: Styles.rankLeftBold,
                            ),
                            Text(
                              get<AchievementController>()
                                      .platinumEarned(get<Achievements>())
                                  ? ""
                                  : " left to ",
                              style: Styles.rankLeftOfBold,
                            ),
                            Text(
                              get<AchievementController>()
                                  .nextRank(get<Achievements>()),
                              style: Styles.rankLeftBold,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Stack(children: <Widget>[
                          Container(
                            height: 16,
                            width: (MediaQuery.of(context).size.width - 52),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    bottomRight: Radius.circular(24)),
                                color: Styles.secondaryGreenColor),
                          ),
                          Container(
                            height: 16,
                            width: (MediaQuery.of(context).size.width - 52) *
                                get<AchievementController>()
                                    .getProgressBarCoeff(get<Achievements>()),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24),
                                    topRight: Radius.circular(24)),
                                color: Styles.primaryGreenColor),
                          )
                        ]),
                      )
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your Achievements",
                            style: Styles.headLine3,
                          ),
                          Row(
                            children: [
                              Text(
                                get<Achievements>()
                                    .getCountOfUnlocked()
                                    .toString(),
                                style: Styles.countOfAchievesText,
                              ),
                              Text(
                                " of ",
                                style: Styles.countOfAchievesText,
                              ),
                              Text(
                                get<Achievements>()
                                    .getCountOfAchievements()
                                    .toString(),
                                style: Styles.rankText,
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(bottom: 24.5),
                          child: GestureDetector(
                            onTap: () {
                              get<AchievementController>().switchView();
                            },
                            child: Row(
                              children: [
                                Text(
                                  get<AchievementController>().getViewSetting()
                                      ? "Show All "
                                      : "Hide All ",
                                  style: Styles.optionText,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: SvgPicture.asset(
                                    "assets/icons/arrow_right.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                )
                              ],
                            ),
                          ))
                    ]),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 84,
                              childAspectRatio: 1 / 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: get<AchievementController>()
                          .getListToView(get<Achievements>())
                          .length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Styles.secondaryGreenColor,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(25.0),
                                        topRight: const Radius.circular(25.0),
                                      ),
                                    ),
                                    child: Column(children: [
                                      Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                        padding:
                                            EdgeInsets.only(top: 0, left: 30),
                                        child: Column(children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              21.33)),
                                                  color: get<AchievementController>()
                                                          .getListToView(
                                                              get<
                                                                  Achievements>())[
                                                              index]
                                                          .getStatus()
                                                      ? Styles
                                                          .secondaryGreenColor
                                                      : Styles
                                                          .achievementLocked,
                                                ),
                                                child: SizedBox(
                                                  height: 80,
                                                  width: 80,
                                                  child: SvgPicture.asset(
                                                    get<AchievementController>()
                                                        .getListToView(
                                                            get<
                                                                Achievements>())[
                                                            index]
                                                        .getSvgPath(),
                                                    color:
                                                        Styles.switchOffColor,
                                                    fit: BoxFit.scaleDown,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      get<AchievementController>()
                                                              .getListToView(
                                                                  get<
                                                                      Achievements>())[
                                                                  index]
                                                              .getStatus()
                                                          ? "Achieved"
                                                          : "Unachieved",
                                                      style: get<Achievements>()
                                                              .getAchievement(
                                                                  index)
                                                              .getStatus()
                                                          ? Styles.textGreen
                                                          : Styles
                                                              .achievementStatusDescription,
                                                    ),
                                                    Text(
                                                      get<AchievementController>()
                                                          .getListToView(
                                                              get<
                                                                  Achievements>())[
                                                              index]
                                                          .getName(),
                                                      style: Styles.headLine1,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 40),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      40,
                                                  child: Text(
                                                    get<AchievementController>()
                                                        .getListToView(
                                                            get<
                                                                Achievements>())[
                                                            index]
                                                        .getDescription(),
                                                    style:
                                                        Styles.optionTextBigger,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ]),
                                      ),
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(21.33)),
                                color: get<AchievementController>()
                                        .getListToView(
                                            get<Achievements>())[index]
                                        .getStatus()
                                    ? Styles.secondaryGreenColor
                                    : Styles.achievementLocked,
                              ),
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: SvgPicture.asset(
                                  get<AchievementController>()
                                      .getListToView(get<Achievements>())[index]
                                      .getSvgPath(),
                                  color: Styles.switchOffColor,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ));
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
