import 'package:flutter/material.dart';

class AppStyles {
  static var addressBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: AppColors.background),
  );
  static var underLineBorder = const UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.white),
  );

  static var focusedTransparentBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );
  static var energyBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static var focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: AppColors.background, width: 0.3),
  );
  static var focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: AppColors.primary, width: 0.3),
  );

  static var focusErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(Dimensions.radius),
    borderSide: const BorderSide(color: AppColors.secondary),
  );
}

errorTextStyle(context) => TextStyle(
    fontSize: 10,
    color: Theme.of(context).errorColor,
    fontWeight: FontWeight.w500,
    height: 1.4);

class Dimensions {
  static double defaultTextSize = 16.00;
  static double smallTextSize = 14.00;
  static double extraSmallTextSize = 12.00;
  static double largeTextSize = 18.00;
  static double extraLargeTextSize = 22.00;

  static const double defaultPaddingSize = 30.00;
  static const double marginSize = 20.00;
  static const double heightSize = 12.00;
  static const double widthSize = 10.00;
  static const double radius = 10.00;
  static const double buttonHeight = 45.00;
}

class AppColors {
  AppColors._();

  static const Color background = Color(0XFFF1F4FA);
  static const Color primary = Color(0XFF3A36DB);
  static const Color secondary = Color(0XFFFF69B4);
  static const Color accent = Color(0XFF03A89E);
  static const Color text = Color(0XFF06152B);
  static const Color textLight = Color(0XFF99B2C6);
  static const Color neutral = Color(0XFFFFFFFF);
}
