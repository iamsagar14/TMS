import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tms/app/modules/favorite/views/favorite_view.dart';
import 'package:tms/app/modules/home/views/home_view.dart';
import 'package:tms/app/modules/notification/views/notification_view.dart';
import 'package:tms/app/modules/profile/views/profile_view.dart';

class DashboardController extends GetxController {
  RxInt currentIndexBottomBar = 0.obs;
  List<Widget> pages = [
    const HomeView(),
    const FavoriteView(),
    const NotificationView(),
    const ProfileView()
  ];

  late PageController pageController;
  void onBottomTabChanged(int index) {
    currentIndexBottomBar(index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onInit() {
    pageController =
        PageController(keepPage: true, initialPage: 0, viewportFraction: 1);

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
