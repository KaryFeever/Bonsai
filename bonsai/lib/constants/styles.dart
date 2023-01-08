/// Color and text style constants
/// Authors:
/// - Naumenko Maksim (xnaume01)
/// - Mikhailov Kirill (xmikha00)
/// - Kovalets Vladyslav (xkoval21)
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color backgroundColor = const Color(0xFFFBFFF6);
  static Color primaryGreenColor = const Color(0xE6B1CF58);
  static Color secondaryGreenColor = const Color(0x33B1CF58);
  static Color scheduleGreenColor = const Color.fromRGBO(88, 99, 54, 1);
  static Color primaryOrangeColor = const Color(0xFFDD9048);
  static Color secondaryOrangeColor = const Color(0x1ADD9048);
  static Color textColorPrimary = const Color(0xFF586336);
  static Color textColorPrimaryLight = Color.fromRGBO(88, 99, 54, 0.494);
  static Color createPageTextColor = const Color(0xFF979797);
  static Color fieldsBackgroundColor = const Color(0xFFEFF1ED);
  static Color switchOffColor = const Color(0xFFB3BCB3);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color buttonBackgroundSecondaryGreen = const Color(0x1A9AB44D);
  static Color buttonBackgroundSecondaryOrange = const Color(0x1ADD9048);
  static Color textOrange = const Color(0xFFDD9048);
  static Color textPaleGreen = const Color.fromRGBO(88, 99, 54, 100);
  static Color achievementLocked = Color.fromRGBO(217, 228, 217, 100);
  static Color cupertinoSwitchBlock = Color.fromRGBO(232, 239, 225, 100);
  static Color chosenOption = Color.fromARGB(156, 204, 210, 198);
  static Color textSecondaryGreen = const Color(0xFFB1CF58);
  static Color hintColor = const Color(0x33586336);

  static TextStyle textPrimary = GoogleFonts.nunito(
      fontSize: 16, color: textColorPrimary, fontWeight: FontWeight.w500);

  static TextStyle textGreen = GoogleFonts.nunito(
      fontSize: 16, color: primaryGreenColor, fontWeight: FontWeight.w500);

  static TextStyle rankText = GoogleFonts.nunito(
      fontSize: 20, color: primaryGreenColor, fontWeight: FontWeight.w600);

  static TextStyle countOfAchievesText = GoogleFonts.nunito(
      fontSize: 19, color: primaryGreenColor, fontWeight: FontWeight.w700);

  static TextStyle rankLeftBold = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimaryLight, fontWeight: FontWeight.w800);

  static TextStyle rankLeftOfBold = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimaryLight, fontWeight: FontWeight.w500);

  static TextStyle optionText = GoogleFonts.nunito(
      fontSize: 18, color: textPaleGreen, fontWeight: FontWeight.w500);

  static TextStyle optionTextBigger = GoogleFonts.nunito(
      fontSize: 22, color: textPaleGreen, fontWeight: FontWeight.w500);

  static TextStyle achievementName = GoogleFonts.nunito(
      fontSize: 30, color: textColorPrimary, fontWeight: FontWeight.w700);

  static TextStyle textGray = GoogleFonts.nunito(
      fontSize: 16, color: createPageTextColor, fontWeight: FontWeight.w500);

  static TextStyle headLine1 = GoogleFonts.nunito(
      fontSize: 34, color: textColorPrimary, fontWeight: FontWeight.w700);

  static TextStyle headLine2 = GoogleFonts.nunito(
      fontSize: 30, color: textColorPrimary, fontWeight: FontWeight.w700);

  static TextStyle headLine3 = GoogleFonts.nunito(
      fontSize: 22, color: textColorPrimary, fontWeight: FontWeight.w700);

  static TextStyle bottomSheetCloseText = GoogleFonts.nunito(
      fontSize: 20, color: primaryGreenColor, fontWeight: FontWeight.w700);

  static TextStyle headLineBottomSheet = GoogleFonts.nunito(
      fontSize: 15, color: createPageTextColor, fontWeight: FontWeight.w600);

  static TextStyle settingDescription = GoogleFonts.nunito(
      fontSize: 18, color: createPageTextColor, fontWeight: FontWeight.w500);

  static TextStyle achievementStatusDescription = GoogleFonts.nunito(
      fontSize: 20, color: createPageTextColor, fontWeight: FontWeight.w600);

  static TextStyle settingsHeader = GoogleFonts.nunito(
      fontSize: 20, color: textColorPrimary, fontWeight: FontWeight.w600);

  static TextStyle settingsHeaderPale = GoogleFonts.nunito(
      fontSize: 20, color: textPaleGreen, fontWeight: FontWeight.w600);

  static TextStyle headLineBottomSheetError = GoogleFonts.nunito(
      fontSize: 15, color: textOrange, fontWeight: FontWeight.w600);

  static TextStyle inputText = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimary, fontWeight: FontWeight.w500);

  static TextStyle inputTextError = GoogleFonts.nunito(
      fontSize: 18, color: textOrange, fontWeight: FontWeight.w600);

  static TextStyle hintText = GoogleFonts.nunito(
      fontSize: 18, color: hintColor, fontWeight: FontWeight.w600);

  static TextStyle careFrequencyText = GoogleFonts.nunito(
      fontSize: 18, color: textColorPrimary, fontWeight: FontWeight.w500);

  static TextStyle buttonText = GoogleFonts.nunito(
      fontSize: 20, color: whiteColor, fontWeight: FontWeight.w700);

  static TextStyle buttonTextOrange = GoogleFonts.nunito(
      fontSize: 20, color: textOrange, fontWeight: FontWeight.w700);

  static TextStyle plantPageDate = GoogleFonts.nunito(
      fontSize: 32, color: textColorPrimary, fontWeight: FontWeight.w800);

  static TextStyle plantPageCareHeadline = GoogleFonts.nunito(
      fontSize: 22, color: textColorPrimary, fontWeight: FontWeight.w600);

  static TextStyle plantPageNextCareText = GoogleFonts.nunito(
      fontSize: 15, color: createPageTextColor, fontWeight: FontWeight.w500);

  static TextStyle plantPageNextCareToday = GoogleFonts.nunito(
      fontSize: 15, color: primaryGreenColor, fontWeight: FontWeight.w600);

  static TextStyle plantPageNextCareDays = GoogleFonts.nunito(
      fontSize: 15, color: createPageTextColor, fontWeight: FontWeight.w700);

  static TextStyle buttonTextSecondaryGreen = GoogleFonts.nunito(
      fontSize: 20, color: textSecondaryGreen, fontWeight: FontWeight.w700);

  static TextStyle plantStatusBad = GoogleFonts.nunito(
      fontSize: 18, color: primaryGreenColor, fontWeight: FontWeight.w700);

  static TextStyle plantStatusOk = GoogleFonts.nunito(
      fontSize: 18, color: scheduleGreenColor, fontWeight: FontWeight.w700);

  static TextStyle careTipsText = GoogleFonts.nunito(
      fontSize: 18,
      color: textColorPrimary.withOpacity(0.5),
      fontWeight: FontWeight.w500);

  static TextStyle textSecondary = GoogleFonts.nunito(
      fontSize: 16,
      color: textColorPrimary.withOpacity(0.65),
      fontWeight: FontWeight.w500);

  static String notSelected =
      "Not selected                                                       ";
}
