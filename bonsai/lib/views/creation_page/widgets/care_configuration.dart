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
                  Row(
                    children: [
                      Text(
                        "Every 3 days",
                        style: Styles.careFrequencyText,
                      ),
                      SvgPicture.asset("assets/icons/arrow_right.svg"),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
