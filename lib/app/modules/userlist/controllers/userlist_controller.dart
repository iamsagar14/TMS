// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/utils/form_input.dart';

class PlaceLIstController extends GetxController {
  TextInput searchInput = const TextInput.pure();
  late FocusNode searchNode;
  @override
  void onInit() {
    searchNode = FocusNode();

    super.onInit();
  }

  void search() {}

  Future<void> fetchUsers() async {}

  @override
  void onClose() {
    searchNode.dispose();

    super.onClose();
  }
}
