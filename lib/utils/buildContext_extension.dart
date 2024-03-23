import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tms/utils/app_theme.dart';

extension ColorXContext on BuildContext {
  HexColor get appPrimaryColor => AppTheme.appColor;
  HexColor get appPrimaryBlackColor => AppTheme.appTitleColor;
  HexColor get appTextBlackColor => AppTheme.cardColor;
  HexColor get appTextLightBlackColor => AppTheme.mediumpurlpeColor;
  HexColor get appTextWhiteColor => AppTheme.bizzardbluwColor;
  HexColor get appTextGreyColor => AppTheme.lightredColor;
  HexColor get borderColor => AppTheme.bodyredColor;
}
extension TextStyleXContext on BuildContext {
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMediu => Theme.of(this).textTheme.titleMedium;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodysmall => Theme.of(this).textTheme.bodySmall;
}
