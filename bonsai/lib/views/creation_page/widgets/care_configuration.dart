import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/styles.dart';

class CareConfiguration extends StatefulWidget {
  CareConfiguration(
      {required this.controller, required this.index, required this.careType});
  CreationController controller;
  int index;
  String careType;

  @override
  State<CareConfiguration> createState() => _CareConfigurationState();
}

class _CareConfigurationState extends State<CareConfiguration> {
  int _selectedHour = 0, _selectedMinute = 0;
  List<String> time = const <String>[
    "Day",
    "Week",
    "Month",
    "Year",
  ];
  List<int> time_frequency = const <int>[
    7,
    4,
    12,
    6,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 16.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        children: [
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6.0),
                topRight: Radius.circular(6.0),
                bottomLeft: widget.controller.getFlag(widget.index)
                    ? Radius.circular(0.0)
                    : Radius.circular(6.0),
                bottomRight: widget.controller.getFlag(widget.index)
                    ? Radius.circular(0.0)
                    : Radius.circular(6.0),
              ),
              color: Styles.fieldsBackgroundColor,
            ),
            child: Container(
              padding: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0x33979797),
                    width: widget.controller.getFlag(widget.index) ? 1.0 : 0.0,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: 12.0,
                        ),
                        child: SvgPicture.asset("assets/icons/watter.svg"),
                      ),
                      Text(
                        "${widget.careType}",
                        style: Styles.inputText,
                      )
                    ],
                  ),
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
                            value: widget.controller.getFlag(widget.index),
                            // changes the state of the switch
                            onChanged: (value) {
                              setState(() => widget.controller
                                  .UpdateFlag(value, widget.index));
                            }),
                      )),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: widget.controller.getFlag(widget.index) ? 48 : 0,
            child: Container(
              height: 48,
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
                color: Styles.fieldsBackgroundColor,
              ),
              padding: EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.careType} frequency",
                    style: Styles.careFrequencyText,
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          // isScrollControlled: true,
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16.0),
                          )),
                          builder: (context) {
                            return Container(
                              height: 400,
                              child: Column(
                                children: [
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
                                    padding: EdgeInsets.only(
                                      bottom: 20.0,
                                      left: 20.0,
                                      right: 20.0,
                                    ),
                                    child: SizedBox(
                                      height: 44,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Set care frequency",
                                            style: Styles.headLine2,
                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Text(
                                              "Cancel",
                                              style:
                                                  Styles.bottomSheetCloseText,
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 1,
                                        child: Divider(
                                          color: Color(0x33979797),
                                          thickness: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: CupertinoPicker(
                                              looping: true,
                                              scrollController:
                                                  new FixedExtentScrollController(
                                                initialItem: _selectedHour,
                                              ),
                                              itemExtent: 40.0,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  _selectedHour = index;
                                                });
                                              },
                                              children:
                                                  new List<Widget>.generate(31,
                                                      (int index) {
                                                return new Center(
                                                  child:
                                                      new Text('${index + 1}'),
                                                );
                                              })),
                                        ),
                                        Expanded(
                                          child: CupertinoPicker(
                                              // looping: true,
                                              scrollController:
                                                  new FixedExtentScrollController(
                                                initialItem: _selectedMinute,
                                              ),
                                              itemExtent: 40.0,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                setState(() {
                                                  _selectedMinute = index;
                                                });
                                              },
                                              children:
                                                  new List<Widget>.generate(
                                                      time.length, (int index) {
                                                return new Center(
                                                  child: new Text(time[index]),
                                                );
                                              })),
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
                                        width:
                                            MediaQuery.of(context).size.width -
                                                40,
                                        decoration: BoxDecoration(
                                          color: Styles.primaryGreenColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Done",
                                              style: Styles.buttonText,
                                            ),
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Text(
                          "Every 3 days",
                          style: Styles.careFrequencyText,
                        ),
                        SvgPicture.asset("assets/icons/arrow_right.svg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
