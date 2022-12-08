import 'package:bonsai/controllers/navigation_page/navigation_controller.dart';
import 'package:bonsai/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class NavigationPage extends StatefulWidget with GetItStatefulWidgetMixin {
  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    Widget currentPage =
        watchOnly((NavigationController x) => x.getCurrentPage());
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      body: Stack(
        children: [
          // Body of the page
          PageStorage(
            bucket: get<NavigationController>().getBucket(),
            child: currentPage,
          ),
          // Navigation bar
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment(0.0, 1.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
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
                          get<NavigationController>().updateCurrentPage(0);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            get<NavigationController>().getCurrentPageIndex() ==
                                    0
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
                          get<NavigationController>().updateCurrentPage(1);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            get<NavigationController>().getCurrentPageIndex() ==
                                    1
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
                          get<NavigationController>().updateCurrentPage(2);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            get<NavigationController>().getCurrentPageIndex() ==
                                    2
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
                          get<NavigationController>().updateCurrentPage(3);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            get<NavigationController>().getCurrentPageIndex() ==
                                    3
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
