import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';

class TourCard extends StatelessWidget {
  const TourCard({
    super.key,
    required this.imageurl,
    required this.title,
  });
  final String imageurl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: context.cardColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: context.appColor,
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset(imageurl),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: context.bodyLarge?.copyWith(
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
