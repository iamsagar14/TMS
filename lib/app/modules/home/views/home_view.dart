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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    (index) => const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: CategoryCard(),
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
                child: Row(
                  children: List.generate(
                    10,
                    (index) => SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(
                              Routes
                                  .TOURPAGE, // Slide animation from right to left
                            );
                          },
                          child: const ImageSmallCard(
                            title: 'Topic about the most viewed Tuitor ',
                            subtitle: 'Motion and measurement of Distance',
                            image:
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7akb2BXgFsCemf37d4eIGaMuP-Q16LcrFiNmUAiUPxg&s',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
