import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';

class BasicPrimaryButton extends StatelessWidget {
  const BasicPrimaryButton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: FilledButton.icon(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50),
          backgroundColor: context.buttonColor,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          textStyle: context.bodyLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        label: Text(title),
        icon: const Icon(
          Icons.arrow_back,
          size: 18,
        ),
      ),
    );
  }
}
