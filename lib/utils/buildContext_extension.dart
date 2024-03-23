import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tms/utils/app_theme.dart';

extension ColorXContext on BuildContext {
  HexColor get appColor => AppTheme.appColor;
  HexColor get appTitleColor => AppTheme.appTitleColor;
  HexColor get cardColor => AppTheme.cardColor;
  HexColor get mediumpurlpeColor => AppTheme.mediumpurlpeColor;
  HexColor get bizzardbluwColor => AppTheme.bizzardbluwColor;
  HexColor get lightredColor => AppTheme.lightredColor;
  HexColor get buttonColor => AppTheme.buttonColor;
   HexColor get yellowLightColor => AppTheme.yellowLightColor;
}
extension TextStyleXContext on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMediu => Theme.of(this).textTheme.titleMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodysmall => Theme.of(this).textTheme.bodySmall;
}
