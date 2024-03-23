// 🐦 Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/app/routes/app_pages.dart';
import 'package:tms/utils/buildContext_extension.dart';
// 🌎 Project imports:

class ImageSmallCard extends StatelessWidget {
  const ImageSmallCard({
    super.key,
    required this.title,
    this.image,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        image != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset('assets/horse.png'),
                      imageUrl: image!,
                      width: double.infinity,
                      height: Get.height * 0.35,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.02,
                    top: Get.height * 0.02,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 5),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.appColor,
                      ),
                      child: Icon(Icons.favorite, color: context.lightredColor),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 0.1,
                    left: Get.width * 0.06,
                    child: SizedBox(
                      width: Get.width * 0.4,
                      child: Text(
                        'Hey visiti this place  pokhapokharpokharpokharpokharr  ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.titleLarge
                            ?.copyWith(color: context.appColor, fontSize: 16),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 0.04,
                    left: Get.width * 0.06,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: context.yellowLightColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '5.10',
                              style: context.bodysmall?.copyWith(
                                  fontSize: 13, color: context.appColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
