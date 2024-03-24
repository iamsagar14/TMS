// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:get/get.dart';
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
                  Image.asset('assets/titleicon.png')
                ],
              ),
              Text(
                'Choose another',
                style: context.bodysmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              const DecoratedTextField(
                hintText: 'Enter name or category',
                borderRadius: 16,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Category',
                style: context.titleMediu?.copyWith(
                  color: context.appTitleColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: CategoryCard(
                        title: index == 0 ? 'Top 30 places' : 'Nature',
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
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Popular',
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
                      children: List.generate(
                        controller.placeCategory.length,
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
                                        controller.placeCategory[index],
                                  },
                                );
                              },
                              child: ImageSmallCard(
                                categoryPlace: controller.placeCategory[index],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
