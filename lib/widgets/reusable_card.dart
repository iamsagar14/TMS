import 'package:flutter/material.dart';
import 'package:tms/utils/buildContext_extension.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

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
                color: context.mediumpurlpeColor,
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset('assets/titleicon.png'),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Top 10 places',
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
