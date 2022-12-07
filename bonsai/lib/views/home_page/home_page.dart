import 'package:bonsai/views/creation_page/creation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 126,
        backgroundColor: Colors.white,
        shadowColor: Colors.grey.shade50,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        )),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your plants",
                  style: Styles.headLine1,
                ),
                Text(
                  "All plants watered",
                  style: Styles.textGreen,
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Styles.secondaryGreenColor,
                  context: context,
                  builder: (context) => CreationPage(),
                );
              },
              child: Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Styles.primaryGreenColor,
                  boxShadow: [
                    BoxShadow(
                      color: Styles.primaryGreenColor,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SvgPicture.asset(
                  "assets/icons/plus.svg",
                  color: Colors.white,
                  height: 19.5,
                  width: 19.5,
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
