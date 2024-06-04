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

part '../widgets/profile_section.dart';
part '../widgets/user_info.dart';

class ProfileScreen extends GetView<ProfileViewController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Padding(
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
