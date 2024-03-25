// 🐦 Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// 📦 Package imports:
import 'package:get/get.dart';
import 'package:tms/app/data/model/populaer_place.dart';
import 'package:tms/services/api/manager/storage_manager.dart';
import 'package:tms/services/locator.dart';
import 'package:tms/utils/buildContext_extension.dart';
// 🌎 Project imports:

class ImageSmallCard extends StatefulWidget {
  const ImageSmallCard({
    super.key,
    required this.popularPlace,
  });

  final PopularPlace popularPlace;

  @override
  State<ImageSmallCard> createState() => _ImageSmallCardState();
}

class _ImageSmallCardState extends State<ImageSmallCard> {
  bool isFavorite = false;
  final _storagemanger = locator.get<StorageManager>();

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.popularPlace.isfavorite = !widget.popularPlace.isfavorite;
      _storagemanger.saveFavorite(
          widget.popularPlace.id.toString(), isFavorite);
    });
  }

  @override
  void initState() {
    super.initState();
    _storagemanger
        .loadFavorite(widget.popularPlace.id.toString())
        .then((value) {
      setState(() {
        isFavorite = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        widget.popularPlace.image != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: CachedNetworkImage(
                      imageUrl: widget.popularPlace.image,
                      width: double.infinity,
                      height: Get.height * 0.35,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                  Positioned(
                    right: Get.width * 0.02,
                    top: Get.height * 0.02,
                    child: GestureDetector(
                      onTap: toggleFavorite,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, right: 5),
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.appColor,
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: context.lightredColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 0.1,
                    left: Get.width * 0.06,
                    child: SizedBox(
                      width: Get.width * 0.5,
                      child: Text(
                        widget.popularPlace.title,
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
                              widget.popularPlace.rating.toString(),
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
