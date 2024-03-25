import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tms/utils/buildContext_extension.dart';
import 'package:tms/widgets/appbutton_button.dart';
import 'package:tms/widgets/communication_dialog.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Profile_appbartitle'.tr,
          style: context.titleMediu,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundImage: CachedNetworkImageProvider(
                    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg'),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(
                      'Profile_changeLanguage'.tr,
                      style: context.bodyLarge,
                    ),
                    subtitle: Text(
                      'Profile_changeLanguageSubtitle'.tr,
                      style: context.bodyLarge?.copyWith(color: Colors.grey),
                    ),
                    onTap: () async {
                      await Get.dialog(
                        CommunicationDialog(
                          title: "dialogue_title".tr,
                          subtitle: "dialogue_subtitle".tr,
                          mainButton: BasicPrimaryButton(
                            onPressed: () {
                              controller
                                  .changeLanguage(const Locale('en', 'Us'));
                              controller.update();
                              Navigator.pop(context);
                            },
                            title: "English",
                               radius: 16,
                            trailingIcon: false,
                          ),
                          secondaryButton: BasicPrimaryButton(
                            onPressed: () {
                              controller
                                  .changeLanguage(const Locale('np', 'NP'));
                              controller.update();
                              Navigator.pop(context);
                            },
                            title: "नेपाली",
                            radius: 16,
                            trailingIcon: false,
                          ),
                        ),
                        barrierDismissible: false,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
