// 🐦 Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/widgets/decorated_back_button.dart';

class ImageBigCardCard extends StatefulWidget {
  const ImageBigCardCard({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  State<ImageBigCardCard> createState() => _ImageBigCardCardState();
}

class _ImageBigCardCardState extends State<ImageBigCardCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.image != null)
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(34),
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        Image.asset('assets/horse.png'),
                    imageUrl: widget.image!,
                    width: double.infinity,
                    height: Get.height * 0.5,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  left: Get.width * 0.02,
                  top: Get.height * 0.02,
                  child: const DecoratedBackButton(),
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
                      padding: const EdgeInsets.only(
                          right: 20, top: 5, bottom: 5, left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: CachedNetworkImageProvider(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7akb2BXgFsCemf37d4eIGaMuP-Q16LcrFiNmUAiUPxg&s'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Azat Khabirov ',
                                style: context.titleMediu?.copyWith(
                                    fontSize: 13, color: context.appColor),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Azat Khabirov ',
                                style: context.bodysmall
                                    ?.copyWith(color: context.appColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -Get.height * 0.02,
                  right: Get.width * 0.08,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, right: 5),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.cardColor,
                    ),
                    child: Center(
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: context.lightredColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
