import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:tms/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:tms/utils/buildContext_extension.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.grid_view,
      Icons.favorite_outline,
      Icons.maps_ugc_outlined,
      Icons.settings_outlined,
    ];

    return Scaffold(
      backgroundColor: context.appColor,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: context.cardColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: context.cardColor,
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                4,
                (index) => GestureDetector(
                  onTap: () {
                    controller.pageController.jumpToPage(index);
                    controller.currentIndexBottomBar.value = index;
                    controller.update();
                  },
                  child: Obx(() => Container(
                        height: 40,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndexBottomBar == index
                              ? context.lightredColor
                              : null,
                        ),
                        child: Center(
                          child: Icon(
                            icons[index],
                            size: 30,
                            color: controller.currentIndexBottomBar == index
                                ? context.appColor
                                : null,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        itemCount: controller.pages.length,
        itemBuilder: (context, index) {
          return controller.pages[index];
        },
      ),
    );
  }
}
