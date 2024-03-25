import 'package:flutter/material.dart';

class CommunicationDialog extends StatelessWidget {
  const CommunicationDialog({
    super.key,
    required this.title,
    this.subtitle,
    this.mainButton,
    this.secondaryButton,
  });
  final String title;
  final String? subtitle;
  final Widget? mainButton;
  final Widget? secondaryButton;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.cancel_outlined)),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            subtitle != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      subtitle!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: secondaryButton ?? const SizedBox(),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: mainButton ?? const SizedBox(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
