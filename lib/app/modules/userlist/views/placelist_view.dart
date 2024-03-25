import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tms/app/modules/home/controllers/home_controller.dart';
import 'package:tms/app/routes/app_pages.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/utils/form_input.dart';
import 'package:tms/utils/string_extension.dart';
import 'package:tms/widgets/decorated_textfield.dart';

class PlacelistView extends GetView<HomeController> {
  const PlacelistView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DecoratedTextField(
                autofucus: true,
                hintText: 'Enter name or category',
                borderRadius: 16,
                onChanged: (value) {
                  controller.searchInput = TextInput.dirty(value: value);
                  controller.update();
                  if (value.isWhiteSpace) {
                    controller.search();
                  }
                },
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (val) {
                  controller.search();
                },
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.popularPlace.length,
                    itemBuilder: (context, index) {
                      var popularplace = controller.popularPlace[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListTile(
                          leading: SizedBox(
                            height: 80,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: popularplace.image,
                              ),
                            ),
                          ),
                          title: Text(popularplace.title,
                              style: context.titleMediu?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                          onTap: () {
                            Get.toNamed(
                              Routes.TOURPAGE,
                              arguments: {
                                "favoritePlace": controller.popularPlace[index],
                              },
                            );
                          },
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
