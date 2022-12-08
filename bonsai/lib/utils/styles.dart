import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color backgroundColor = const Color(0xFFFBFFF6);
  static Color primaryGreenColor = const Color(0xE6B1CF58);
  static Color secondaryGreenColor = const Color(0x33B1CF58);
  static Color primaryOrangeColor = const Color(0xFFDD9048);
  static Color secondaryOrangeColor = const Color(0x1ADD9048);
  static Color textColorPrimary = const Color(0xFF586336);
  static Color createPageTextColor = const Color(0xFF979797);
  static Color fieldsBackgroundColor = const Color(0xFFEFF1ED);
  static Color switchOffColor = const Color(0xFFB3BCB3);
  static Color whiteColor = const Color(0xFFFFFFFF);

  static TextStyle textPrimary = GoogleFonts.nunito(
      fontSize: 16, color: textColorPrimary, fontWeight: FontWeight.w500);
  static TextStyle textGreen = GoogleFonts.nunito(
      fontSize: 16, color: primaryGreenColor, fontWeight: FontWeight.w500);
  static TextStyle headLine1 = GoogleFonts.nunito(
      fontSize: 34, color: textColorPrimary, fontWeight: FontWeight.w700);
  static TextStyle headLine2 = GoogleFonts.nunito(
      fontSize: 28, color: textColorPrimary, fontWeight: FontWeight.w700);
  static TextStyle bottomSheetCloseText = GoogleFonts.nunito(
      fontSize: 20, color: primaryGreenColor, fontWeight: FontWeight.w700);
  static TextStyle headLineBottomSheet = GoogleFonts.nunito(
      fontSize: 15, color: createPageTextColor, fontWeight: FontWeight.w600);
  static TextStyle inputText = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimary, fontWeight: FontWeight.w600);
  static TextStyle careFrequencyText = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimary, fontWeight: FontWeight.w500);
  static TextStyle buttonText = GoogleFonts.nunito(
      fontSize: 20, color: whiteColor, fontWeight: FontWeight.w700);
}
