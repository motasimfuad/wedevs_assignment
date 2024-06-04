part of '../views/profile_screen.dart';

class _UserInfo extends StatelessWidget {
  const _UserInfo({
    super.key,
    required this.controller,
  });

  final ProfileViewController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 40.h),
            child: DottedBorder(
              borderType: BorderType.Circle,
              radius: Radius.circular(500.w),
              padding: EdgeInsets.all(8.w),
              color: const Color(0xFFFFADAD),
              dashPattern: const [6, 3],
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(500.w),
                ),
                child: Obx(
                  () {
                    return SizedBox(
                      height: 112.w,
                      width: 112.w,
                      child: (controller.profileIsLoading)
                          ? const CupertinoActivityIndicator(
                              color: AppColors.primary,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  (controller.userDetails.value?.avatarUrls !=
                                          null)
                                      ? controller
                                          .userDetails.value!.avatarUrls!["96"]!
                                      : AppConstants.noImagePlaceholder,
                              fit: BoxFit.cover,
                            ),
                    );
                  },
                ),
              ),
            ),
          ),
          Obx(
            () => Text(
              (controller.profileIsLoading)
                  ? '...'
                  : controller.userDetails.value?.name ?? "Unknown User",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(
            () => Text(
              (controller.profileIsLoading)
                  ? '...'
                  : controller.userDetails.value?.email ?? "N/A",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
