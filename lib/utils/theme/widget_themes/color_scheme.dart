import 'package:flutter/material.dart';
import 'package:students_complaint_app/utils/constants/colors.dart';
// Import the CColors constants

class CColorsScheme {
  CColorsScheme._(); // Private constructor to prevent instantiation

  // Light Theme Color Scheme
  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: CColors.primary, // Dark Green
    secondary: CColors.secondary, // Light Green
    surface: CColors.light, // Light grey surface
    error: CColors.error, // Red for errors
    onPrimary: CColors.textWhite, // White text on primary
    onSecondary: CColors.textWhite, // White text on secondary
    onSurface: CColors.textPrimary, // Dark grey text on surface
    onError: CColors.textWhite, // White text on error
    primaryContainer: CColors.lightContainer, // Container color for primary elements
    secondaryContainer: CColors.accent, // Accent yellow-green for secondary containers
    onPrimaryContainer: CColors.darkGrey, // Dark text on light containers
    onSecondaryContainer: CColors.textSecondary,// Light grey text on secondary containers
  );

  // Dark Theme Color Scheme
  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: CColors.primary, // Dark Green
    secondary: CColors.secondary, // Light Green
    surface: CColors.darkerGrey, // Dark grey surface
    error: CColors.error, // Red for errors
    onPrimary: CColors.textWhite, // White text on primary
    onSecondary: CColors.textWhite, // White text on secondary
    onSurface: CColors.textWhite, // White text on dark surface
    onError: CColors.textWhite, // White text on error
    primaryContainer: CColors.darkContainer, // Slightly transparent white container for dark mode
    secondaryContainer: CColors.accent, // Accent yellow-green for secondary containers
    onPrimaryContainer: CColors.textWhite, // White text on dark containers
    onSecondaryContainer: CColors.textSecondary, // Light grey text on secondary containers
  );
}
