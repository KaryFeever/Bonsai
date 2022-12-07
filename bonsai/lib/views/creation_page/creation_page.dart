import 'package:bonsai/controllers/creation_page/creation_controller.dart';
import 'package:bonsai/utils/styles.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
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
                child: Divider(
                  color: Color(0x33979797),
                  thickness: 2,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 26.0,
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
                          showCursor: false,
                          style: Styles.inputText,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Styles.fieldsBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0)),
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
                          showCursor: false,
                          style: Styles.inputText,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Styles.fieldsBackgroundColor,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8.0)),
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
          //
          //
          //
          //
          //
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
                // Container(
                //   height: 48,
                //   width: MediaQuery.of(context).size.width - 40,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(6.0),
                //       topRight: Radius.circular(6.0),
                //       bottomLeft: wateringFlag
                //           ? Radius.circular(0.0)
                //           : Radius.circular(6.0),
                //       bottomRight: wateringFlag
                //           ? Radius.circular(0.0)
                //           : Radius.circular(6.0),
                //     ),
                //     color: Styles.fieldsBackgroundColor,
                //   ),
                //   child: Container(
                //     padding: EdgeInsets.only(
                //       left: 12.0,
                //       right: 12.0,
                //     ),
                //     decoration: BoxDecoration(
                //       border: Border(
                //         bottom: BorderSide(
                //           color: Color(0x33979797),
                //           width: wateringFlag ? 1.0 : 0.0,
                //         ),
                //       ),
                //     ),
                //     child: Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Row(
                //           children: [
                //             Container(
                //               margin: EdgeInsets.only(
                //                 right: 12.0,
                //               ),
                //               child:
                //                   SvgPicture.asset("assets/icons/watter.svg"),
                //             ),
                //             Text(
                //               "Watering",
                //               style: Styles.inputText,
                //             )
                //           ],
                //         ),
                //         SizedBox(
                //             width: 40,
                //             height: 24,
                //             child: FittedBox(
                //               fit: BoxFit.fill,
                //               child: CupertinoSwitch(
                //                 // overrides the default green color of the track
                //                 activeColor: Styles.primaryGreenColor,
                //                 // color of the round icon, which moves from right to left
                //                 thumbColor: Colors.white,
                //                 // when the switch is off
                //                 trackColor: Styles.switchOffColor,
                //                 // boolean variable value
                //                 value: wateringFlag,
                //                 // changes the state of the switch
                //                 onChanged: (value) =>
                //                     setState(() => wateringFlag = value),
                //               ),
                //             )),
                //       ],
                //     ),
                //   ),
                // ),
                // AnimatedContainer(
                //   duration: const Duration(milliseconds: 200),
                //   height: wateringFlag ? 48 : 0,
                //   child: Container(
                //     height: 48,
                //     width: MediaQuery.of(context).size.width - 40,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         bottomLeft: Radius.circular(6.0),
                //         bottomRight: Radius.circular(6.0),
                //       ),
                //       color: Styles.fieldsBackgroundColor,
                //     ),
                //     padding: EdgeInsets.only(
                //       left: 12.0,
                //       right: 12.0,
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Text(
                //           "Watering frequency",
                //           style: Styles.careFrequencyText,
                //         ),
                //         GestureDetector(
                //           onTap: () {
                //             showModalBottomSheet(
                //                 context: context,
                //                 builder: (BuildContext context) {
                //                   return Container(
                //                     height: 200.0,
                //                     color: Colors.white,
                //                     child: Row(
                //                       crossAxisAlignment:
                //                           CrossAxisAlignment.start,
                //                       children: <Widget>[
                //                         CupertinoButton(
                //                           child: Text("Cancel"),
                //                           onPressed: () {
                //                             Navigator.pop(context);
                //                           },
                //                         ),
                //                         Expanded(
                //                           child: CupertinoPicker(
                //                               scrollController:
                //                                   new FixedExtentScrollController(
                //                                 initialItem: _selectedHour,
                //                               ),
                //                               itemExtent: 32.0,
                //                               backgroundColor: Colors.white,
                //                               onSelectedItemChanged:
                //                                   (int index) {
                //                                 setState(() {
                //                                   _selectedHour = index;
                //                                 });
                //                               },
                //                               children:
                //                                   new List<Widget>.generate(24,
                //                                       (int index) {
                //                                 return new Center(
                //                                   child:
                //                                       new Text('${index + 1}'),
                //                                 );
                //                               })),
                //                         ),
                //                         Expanded(
                //                           child: CupertinoPicker(
                //                               scrollController:
                //                                   new FixedExtentScrollController(
                //                                 initialItem: _selectedMinute,
                //                               ),
                //                               itemExtent: 32.0,
                //                               backgroundColor: Colors.white,
                //                               onSelectedItemChanged:
                //                                   (int index) {
                //                                 setState(() {
                //                                   _selectedMinute = index;
                //                                 });
                //                               },
                //                               children:
                //                                   new List<Widget>.generate(60,
                //                                       (int index) {
                //                                 return new Center(
                //                                   child:
                //                                       new Text('${index + 1}'),
                //                                 );
                //                               })),
                //                         ),
                //                       ],
                //                     ),
                //                   );
                //                 });
                //           },
                //           child: Row(
                //             children: [
                //               Text(
                //                 "Every 3 days",
                //                 style: Styles.careFrequencyText,
                //               ),
                //               SvgPicture.asset("assets/icons/arrow_right.svg"),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),

          //
          //
          //
          //
          // Padding(
          //   padding: EdgeInsets.only(
          //     bottom: 16.0,
          //     left: 20.0,
          //     right: 20.0,
          //   ),
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 48,
          //         width: MediaQuery.of(context).size.width - 40,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(6.0),
          //             topRight: Radius.circular(6.0),
          //             bottomLeft: _controller.getFlag()
          //                 ? Radius.circular(0.0)
          //                 : Radius.circular(6.0),
          //             bottomRight: _controller.getFlag()
          //                 ? Radius.circular(0.0)
          //                 : Radius.circular(6.0),
          //           ),
          //           color: Styles.fieldsBackgroundColor,
          //         ),
          //         child: Container(
          //           padding: EdgeInsets.only(
          //             left: 12.0,
          //             right: 12.0,
          //           ),
          //           decoration: BoxDecoration(
          //             border: Border(
          //               bottom: BorderSide(
          //                 color: Color(0x33979797),
          //                 width: _controller.getFlag() ? 1.0 : 0.0,
          //               ),
          //             ),
          //           ),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Row(
          //                 children: [
          //                   Container(
          //                     margin: EdgeInsets.only(
          //                       right: 12.0,
          //                     ),
          //                     child:
          //                         SvgPicture.asset("assets/icons/watter.svg"),
          //                   ),
          //                   Text(
          //                     "Spraying",
          //                     style: Styles.inputText,
          //                   )
          //                 ],
          //               ),
          //               SizedBox(
          //                   width: 40,
          //                   height: 24,
          //                   child: FittedBox(
          //                     fit: BoxFit.fill,
          //                     child: CupertinoSwitch(
          //                         // overrides the default green color of the track
          //                         activeColor: Styles.primaryGreenColor,
          //                         // color of the round icon, which moves from right to left
          //                         thumbColor: Colors.white,
          //                         // when the switch is off
          //                         trackColor: Styles.switchOffColor,
          //                         // boolean variable value
          //                         value: _controller.getFlag(),
          //                         // changes the state of the switch
          //                         onChanged: (value) {
          //                           setState(
          //                               () => _controller.UpdateFlag(value));
          //                         }),
          //                   )),
          //             ],
          //           ),
          //         ),
          //       ),
          //       AnimatedContainer(
          //         duration: const Duration(milliseconds: 200),
          //         height: _controller.getFlag() ? 48 : 0,
          //         child: Container(
          //           height: 48,
          //           width: MediaQuery.of(context).size.width - 40,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(6.0),
          //               bottomRight: Radius.circular(6.0),
          //             ),
          //             color: Styles.fieldsBackgroundColor,
          //           ),
          //           padding: EdgeInsets.only(
          //             left: 12.0,
          //             right: 12.0,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "Spraying frequency",
          //                 style: Styles.careFrequencyText,
          //               ),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "Every 3 days",
          //                     style: Styles.careFrequencyText,
          //                   ),
          //                   SvgPicture.asset("assets/icons/arrow_right.svg"),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          CareConfiguration(
            controller: _controller,
            index: 0,
            careType: "Watering",
          ),
          CareConfiguration(
            controller: _controller,
            index: 1,
            careType: "Spraying",
          ),
          CareConfiguration(
            controller: _controller,
            index: 2,
            careType: "Fertilizing",
          ),
          //
          //
          //
          //
          //
          //
          // Padding(
          //   padding: EdgeInsets.only(
          //     bottom: 16.0,
          //     left: 20.0,
          //     right: 20.0,
          //   ),
          //   child: Column(
          //     children: [
          //       Container(
          //         height: 48,
          //         width: MediaQuery.of(context).size.width - 40,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(6.0),
          //             topRight: Radius.circular(6.0),
          //             bottomLeft: fertilizingFlag
          //                 ? Radius.circular(0.0)
          //                 : Radius.circular(6.0),
          //             bottomRight: fertilizingFlag
          //                 ? Radius.circular(0.0)
          //                 : Radius.circular(6.0),
          //           ),
          //           color: Styles.fieldsBackgroundColor,
          //         ),
          //         child: Container(
          //           padding: EdgeInsets.only(
          //             left: 12.0,
          //             right: 12.0,
          //           ),
          //           decoration: BoxDecoration(
          //             border: Border(
          //               bottom: BorderSide(
          //                 color: Color(0x33979797),
          //                 width: fertilizingFlag ? 1.0 : 0.0,
          //               ),
          //             ),
          //           ),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Row(
          //                 children: [
          //                   Container(
          //                     margin: EdgeInsets.only(
          //                       right: 12.0,
          //                     ),
          //                     child:
          //                         SvgPicture.asset("assets/icons/watter.svg"),
          //                   ),
          //                   Text(
          //                     "Fertilizing",
          //                     style: Styles.inputText,
          //                   )
          //                 ],
          //               ),
          //               SizedBox(
          //                   width: 40,
          //                   height: 24,
          //                   child: FittedBox(
          //                     fit: BoxFit.fill,
          //                     child: CupertinoSwitch(
          //                         // overrides the default green color of the track
          //                         activeColor: Styles.primaryGreenColor,
          //                         // color of the round icon, which moves from right to left
          //                         thumbColor: Colors.white,
          //                         // when the switch is off
          //                         trackColor: Styles.switchOffColor,
          //                         // boolean variable value
          //                         value: fertilizingFlag,
          //                         // changes the state of the switch
          //                         onChanged: (value) {
          //                           setState(() => fertilizingFlag = value);
          //                           print("WTF" +
          //                               _controller.getFlag().toString());
          //                         }),
          //                   )),
          //             ],
          //           ),
          //         ),
          //       ),
          //       AnimatedContainer(
          //         duration: const Duration(milliseconds: 200),
          //         height: fertilizingFlag ? 48 : 0,
          //         child: Container(
          //           height: 48,
          //           width: MediaQuery.of(context).size.width - 40,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(6.0),
          //               bottomRight: Radius.circular(6.0),
          //             ),
          //             color: Styles.fieldsBackgroundColor,
          //           ),
          //           padding: EdgeInsets.only(
          //             left: 12.0,
          //             right: 12.0,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 "Fertilizing frequency",
          //                 style: Styles.careFrequencyText,
          //               ),
          //               Row(
          //                 children: [
          //                   Text(
          //                     "Every 3 days",
          //                     style: Styles.careFrequencyText,
          //                   ),
          //                   SvgPicture.asset("assets/icons/arrow_right.svg"),
          //                 ],
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
