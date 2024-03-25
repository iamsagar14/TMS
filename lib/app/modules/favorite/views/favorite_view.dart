import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tms/app/modules/home/controllers/home_controller.dart';
import 'package:tms/utils/buildContext_extension.dart';

import '../controllers/favorite_controller.dart';

class FavoriteView extends GetView<FavoriteController> {
  const FavoriteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var homecontroller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: context.appColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'favorite_appbartitle'.tr,
          style: context.titleMediu,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Obx(() => Column(
              children: List.generate(
                homecontroller.favoritePlace.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: SizedBox(
                      height: 80,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: homecontroller.favoritePlace[index].image,
                        ),
                      ),
                    ),
                    title: Text(
                      homecontroller.favoritePlace[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.star,
                          color: context.yellowLightColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          homecontroller.favoritePlace[index].rating.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    onTap: () {},
                    trailing: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
