import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.imageurl,
    required this.iconBackgroundColor,
  });
  final String title;
  final String imageurl;
  final Color iconBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: context.cardColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset(imageurl),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: context.bodyLarge?.copyWith(
              color: context.appTitleColor,
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
