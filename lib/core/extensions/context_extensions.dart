import 'package:flutter/material.dart';
import 'dart:math';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get _height => mediaQuery.size.height;
  double dynamicHeight(double percent) =>
      (mediaQuery.size.height * percent) / 100;
  double dynamicWidth(double percent) =>
      (mediaQuery.size.width * percent) / 100;

  double get lowValue => _height * 0.01;
  double get normalValue => _height * 0.02;
  double get mediumValue => _height * 0.04;
  double get highValue => _height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension DurationExtension on BuildContext {
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration =>const Duration(seconds: 1);
  Duration get hightDuration => const Duration(seconds: 2);
}

extension SizedBoxExtension on BuildContext {
  Widget get lowSizedBox => SizedBox(height: lowValue);
  Widget get mediumSizedBox => SizedBox(height: normalValue);
  Widget get normalSizedBox => SizedBox(height: mediumValue);
  Widget get heightSizedBox => SizedBox(height: highValue);

  Widget get lowSizedBoxWidth => SizedBox(width: lowValue);
  Widget get mediumSizedBoxWidth => SizedBox(width: normalValue);
  Widget get normalSizedBoxWidth => SizedBox(width: mediumValue);
  Widget get heightSizedBoxWidth => SizedBox(width: highValue);
}

extension RandomColor on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}
