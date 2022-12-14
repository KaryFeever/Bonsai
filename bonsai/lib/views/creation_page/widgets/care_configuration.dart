/// Widget for the care configuration
/// Author: Naumenko Maksim (xnaume01)
import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/controllers/edit_page/edit_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../constants/styles.dart';

class CareConfiguration extends StatefulWidget with GetItStatefulWidgetMixin {
  CareConfiguration(
      {required this.index,
      required this.careType,
      required this.controller,
      required this.mode});
  int index;
  String careType;
  final controller;
  bool mode;

  @override
  State<CareConfiguration> createState() => _CareConfigurationState();
}

class _CareConfigurationState extends State<CareConfiguration>
    with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    bool careEnabled = widget.mode == false
        ? watchOnly((CreationController x) => x.getFlag(widget.index))
        : watchOnly((EditController x) => x.getFlag(widget.index));
    int frequencyIndex = widget.mode == false
        ? watchOnly((CreationController x) => x.getFrequencyIndex(widget.index))
        : watchOnly((EditController x) => x.getFrequencyIndex(widget.index));
    int timeIndex = widget.mode == false
        ? watchOnly((CreationController x) => x.getTimeIndex(widget.index))
        : watchOnly((EditController x) => x.getTimeIndex(widget.index));
    String careFrequencyText = widget.mode == false
        ? watchOnly(
            (CreationController x) => x.getCareFrequencyText(widget.index))
        : watchOnly((EditController x) => x.getCareFrequencyText(widget.index));
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
                bottomLeft:
                    careEnabled ? Radius.circular(0.0) : Radius.circular(6.0),
                bottomRight:
                    careEnabled ? Radius.circular(0.0) : Radius.circular(6.0),
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
                    width: careEnabled ? 1.0 : 0.0,
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
                            value: careEnabled,
                            // changes the state of the switch
                            onChanged: (value) {
                              widget.controller.UpdateFlag(value, widget.index);
                            }),
                      )),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: careEnabled ? 48 : 0,
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
                                                initialItem: frequencyIndex,
                                              ),
                                              itemExtent: 40.0,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                widget.controller
                                                    .setFrequencyIndex(
                                                        widget.index, index);
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
                                                initialItem: timeIndex,
                                              ),
                                              itemExtent: 40.0,
                                              backgroundColor: Colors.white,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                widget.controller.setTimeIndex(
                                                    widget.index, index);
                                              },
                                              children:
                                                  new List<Widget>.generate(
                                                      widget.controller
                                                          .getTimeListLength(),
                                                      (int index) {
                                                return new Center(
                                                  child: new Text(widget
                                                      .controller
                                                      .getTimeItem(index)),
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
                                      child: GestureDetector(
                                        onTap: () {
                                          widget.controller
                                              .updateCareFrequencyText(
                                                  widget.index);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                            height: 60,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
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
                                      )),
                                ],
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Text(
                          careFrequencyText,
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
