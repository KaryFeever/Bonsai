import 'package:bonsai/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _enableNotifications = true;
  bool _darkTheme = false;
  @override
  Widget build(BuildContext context) {
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
                "Settings",
                style: Styles.headLine1,
              )
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 28),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 4),
                child: Text(
                  "Notifications",
                  style: Styles.settingDescription,
                ),
              ),
              Container(
                  height: 51,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Styles.cupertinoSwitchBlock),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              "assets/icons/notification.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Push notifications",
                              style: Styles.settingsHeader,
                            ),
                          )
                        ]),
                        SizedBox(
                            width: 40,
                            height: 24,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: CupertinoSwitch(
                                  // overrides the default green color of the track
                                  activeColor: Styles.primaryGreenColor,
                                  // color of the round icon, which moves from right to left
                                  thumbColor: Colors.white,
                                  // when the switch is off
                                  trackColor: Styles.switchOffColor,
                                  // boolean variable value
                                  value: _enableNotifications,
                                  // changes the state of the switch
                                  onChanged: (value) {
                                    setState(() {
                                      _enableNotifications = value;
                                    });
                                  }),
                            ))
                      ],
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 4),
                child: Text(
                  "App Theme",
                  style: Styles.settingDescription,
                ),
              ),
              Container(
                  height: 51,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Styles.cupertinoSwitchBlock),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(
                              "assets/icons/moon.svg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Dark Theme",
                              style: Styles.settingsHeader,
                            ),
                          )
                        ]),
                        SizedBox(
                            width: 40,
                            height: 24,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: CupertinoSwitch(
                                  // overrides the default green color of the track
                                  activeColor: Styles.primaryGreenColor,
                                  // color of the round icon, which moves from right to left
                                  thumbColor: Colors.white,
                                  // when the switch is off
                                  trackColor: Styles.switchOffColor,
                                  // boolean variable value
                                  value: _darkTheme,
                                  // changes the state of the switch
                                  onChanged: (value) {
                                    setState(() {
                                      _darkTheme = value;
                                    });
                                  }),
                            ))
                      ],
                    ),
                  ))
            ])));
  }
}
