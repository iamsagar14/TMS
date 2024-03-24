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
              const ImageBigCardCard(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7akb2BXgFsCemf37d4eIGaMuP-Q16LcrFiNmUAiUPxg&s',
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Shulgaт-Tash cave ',
                style: context.titleLarge?.copyWith(
                  fontSize: 28,
                  color: context.appTitleColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SingleChildScrollView(
                child: ExpandedWidget(
                  text:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                ),
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
                              ? 'assets/onboard.png'
                              : index == 1
                                  ? 'assets/car.png'
                                  : index == 2
                                      ? 'assets/car.png'
                                      : 'assets/onboard.png',
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BasicPrimaryButton(
                title: 'Buy a tour',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
