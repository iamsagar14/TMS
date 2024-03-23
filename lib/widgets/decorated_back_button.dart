import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tms/utils/buildContext_extension.dart';

class DecoratedBackButton extends StatelessWidget {
  const DecoratedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Center(
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
    );
  }
}
