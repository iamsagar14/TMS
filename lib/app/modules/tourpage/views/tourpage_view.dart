import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/widgets/appbutton_button.dart';
import 'package:tms/widgets/expanded_widgets.dart';
import 'package:tms/widgets/image_big_card.dart';
import 'package:tms/widgets/tour_card.dart';

import '../controllers/tourpage_controller.dart';

class TourpageView extends GetView<TourpageController> {
  const TourpageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              ImageBigCardCard(
                image: controller.categoryPlace!.image,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                controller.categoryPlace!.title,
                style: context.titleLarge?.copyWith(
                  fontSize: 28,
                  color: context.appTitleColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child:
                    ExpandedWidget(text: controller.categoryPlace!.description),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TourCard(
                          imageurl: index == 0
                              ? 'assets/book.png'
                              : index == 1
                                  ? 'assets/car.png'
                                  : index == 2
                                      ? 'assets/onboard.png'
                                      : 'assets/car.png',
                          title: index == 0
                              ? 'From 90 Rs'
                              : index == 1
                                  ? 'Tavel Here'
                                  : 'omboard',
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BasicPrimaryButton(
                title: 'button_title'.tr,
                onPressed: () {},
                radius: 40,
                trailingIcon: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
