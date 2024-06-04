import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';
import 'package:motasimfuad_wedevs/src/features/profile/controllers/profile_view_controller.dart';
import 'package:motasimfuad_wedevs/src/utils/app_constants.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

part '../widgets/profile_section.dart';
part '../widgets/user_info.dart';

class ProfileScreen extends GetView<ProfileViewController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getUserDetails();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _UserInfo(controller: controller),
              Container(
                padding: EdgeInsets.all(20.w),
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => ProfileSection(
                            title: "Account",
                            icon: Assets.dashboardTab4,
                            children: (controller.profileIsLoading)
                                ? [
                                    SizedBox(
                                      height: 100.h,
                                      child: const CupertinoActivityIndicator(),
                                    )
                                  ]
                                : [
                                    OutlinedInputField(
                                      labelText: "Email",
                                      hintText: "youremail@xmail.com",
                                      controller: controller.emailController,
                                    ),
                                    OutlinedInputField(
                                      labelText: "Full Name",
                                      hintText: "William Bennett",
                                      controller: controller.fullNameController,
                                    ),
                                    OutlinedInputField(
                                      labelText: "Street Address",
                                      hintText: "465 Nolan Causeway Suite 079",
                                      controller: TextEditingController(),
                                      isDisabled: true,
                                    ),
                                    OutlinedInputField(
                                      labelText: "Apt, Suite, Bldg (optional)",
                                      hintText: "Unit 512",
                                      controller: TextEditingController(),
                                      isDisabled: true,
                                    ),
                                    SizedBox(
                                      width: 90.w,
                                      child: OutlinedInputField(
                                        labelText: "Zip Code",
                                        hintText: "77017",
                                        controller: TextEditingController(),
                                        isDisabled: true,
                                      ),
                                    ),
                                    SizedBox(height: 24.h),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: PrimaryButton(
                                            height: 50.h,
                                            onTap: () {
                                              Get.back();
                                            },
                                            title: "Cancel",
                                            backgroundColor: Colors.white,
                                            textColor: AppColors.grey,
                                            borderColor: Colors.grey.shade300,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Expanded(
                                          child: PrimaryButton(
                                            height: 50.h,
                                            onTap: () {},
                                            title: "Save",
                                            backgroundColor: AppColors.success,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                          ),
                        ),
                        _makeDivider(),
                        const ProfileSection(
                          title: "Passwords",
                          icon: Assets.password,
                          children: [],
                        ),
                        _makeDivider(),
                        const ProfileSection(
                          title: "Notification",
                          icon: Assets.notification,
                          children: [],
                        ),
                        _makeDivider(),
                        const ProfileSection(
                          title: "Wishlist (00)",
                          icon: Assets.wishlist,
                          children: [],
                        ),
                      ],
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

  Divider _makeDivider() {
    return Divider(
      height: 0.5,
      color: Colors.grey.shade200,
      indent: 20,
      endIndent: 20,
    );
  }
}
