// 🐦 Flutter imports:
import 'package:tms/main_common.dart';
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:tms/config/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  mainCommon(flavor: Flavor.development);
}
