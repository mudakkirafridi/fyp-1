import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/appbar_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/bootom_sheet_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/checkbox_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/chip_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/color_scheme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/text_theme.dart';
import 'package:students_complaint_app/utils/theme/widget_themes/textfield_theme.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: CColorsScheme.lightColorScheme, // Use light color scheme
    textTheme: CTextTheme.lightTextTheme,
    chipTheme: CChipTheme.lightChipTheme,
    scaffoldBackgroundColor: CColorsScheme.lightColorScheme.surface, // Use background from ColorScheme
    checkboxTheme: CCheckboxTheme.lightCheckboxTheme,
    appBarTheme: CAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: CColorsScheme.darkColorScheme, // Use dark color scheme
    textTheme: CTextTheme.darkTextTheme,
    chipTheme: CChipTheme.darkChipTheme,
    scaffoldBackgroundColor: CColorsScheme.darkColorScheme.surface, // Use background from ColorScheme
    checkboxTheme: CCheckboxTheme.darkCheckboxTheme,
    appBarTheme: CAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: CBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
  );
}
