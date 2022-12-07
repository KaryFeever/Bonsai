import 'dart:ffi';

import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/utils/styles.dart';
import 'package:bonsai/views/achievements_page/achievements_page.dart';
import 'package:bonsai/views/creation_page/widgets/care_configuration.dart';
import 'package:bonsai/views/home_page/home_page.dart';
import 'package:bonsai/views/settings_page/settings_page.dart';
import 'package:bonsai/views/tips_page/tips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // create controller
  final NavigationController _controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Stack(
        children: [
          // Body of the page
          PageStorage(
            bucket: _controller.getBucket(),
            child: _controller.getCurrentPage(),
          ),
          // Navigation bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Container(
                  height: 64,
                  color: Styles.primaryGreenColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: 28,
                        onPressed: () {
                          setState(() {
                            _controller.UpdatePage(0);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _controller.getCurrentPageIndex() == 0
                                ? SvgPicture.asset(
                                    "assets/icons/home_active.svg")
                                : SvgPicture.asset(
                                    "assets/icons/home_nonactive.svg"),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 28,
                        onPressed: () {
                          setState(() {
                            _controller.UpdatePage(1);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _controller.getCurrentPageIndex() == 1
                                ? SvgPicture.asset(
                                    "assets/icons/tips_active.svg")
                                : SvgPicture.asset(
                                    "assets/icons/tips_nonactive.svg"),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 28,
                        onPressed: () {
                          setState(() {
                            _controller.UpdatePage(2);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _controller.getCurrentPageIndex() == 2
                                ? SvgPicture.asset(
                                    "assets/icons/achievements_active.svg")
                                : SvgPicture.asset(
                                    "assets/icons/achievements_nonactive.svg"),
                          ],
                        ),
                      ),
                      MaterialButton(
                        minWidth: 28,
                        onPressed: () {
                          setState(() {
                            _controller.UpdatePage(3);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _controller.getCurrentPageIndex() == 3
                                ? SvgPicture.asset(
                                    "assets/icons/settings_active.svg")
                                : SvgPicture.asset(
                                    "assets/icons/settings_nonactive.svg"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
