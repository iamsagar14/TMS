// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';
import 'package:tms/app/routes/app_pages.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/widgets/reusable_card.dart';
import 'package:tms/widgets/decorated_textfield.dart';
import 'package:tms/widgets/image_small_card.dart';

// 🌎 Project imports:
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'GOGO',
                    style: context.titleLarge?.copyWith(
                      color: context.appTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SEARCHPAGE);
                      },
                      child: Image.asset('assets/titleicon.png'))
                ],
              ),
              Text(
                'home_subtitle'.tr,
                style: context.bodysmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              DecoratedTextField(
                onTap: () {
                  Get.toNamed(Routes.SEARCHPAGE);
                },
                hintText: 'home_textFieldhindtext'.tr,
                borderRadius: 16,
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'home_Category'.tr,
                style: context.titleMediu?.copyWith(
                  color: context.appTitleColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Row(
                      children: controller.isLoadingCategory.isFalse
                          ? List.generate(
                              controller.placeCategory.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: CategoryCard(
                                  title: controller.placeCategory[index].title
                                      .toString(),
                                  imageurl: index == 0
                                      ? 'assets/starticon.png'
                                      : index == 1
                                          ? 'assets/treeicon.png'
                                          : 'assets/stupa.png',
                                  iconBackgroundColor: index == 0
                                      ? context.mediumpurlpeColor
                                      : index == 1
                                          ? context.bizzardbluwColor
                                          : context.lightredColor,
                                ),
                              ),
                            )
                          : List.generate(
                              5,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: Center(
                                      child: SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          randomWidth: false,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                        ),
                                      ),
                                    ),
                                  )),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'home_popular'.tr,
                style: context.titleMediu?.copyWith(
                  color: context.appTitleColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() => Row(
                      children: controller.isLoading.isFalse
                          ? List.generate(
                              controller.popularPlace.length,
                              (index) => SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.TOURPAGE,
                                        arguments: {
                                          "favoritePlace":
                                              controller.popularPlace[index],
                                        },
                                      );
                                    },
                                    child: ImageSmallCard(
                                      popularPlace:
                                          controller.popularPlace[index],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : List.generate(
                              5,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Center(
                                      child: SkeletonAvatar(
                                        style: SkeletonAvatarStyle(
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          randomWidth: false,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                        ),
                                      ),
                                    ),
                                  )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
