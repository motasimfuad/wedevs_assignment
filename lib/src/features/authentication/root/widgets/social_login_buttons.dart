import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 40.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _SocialButton(icon: Assets.fb),
          SizedBox(width: 8.w),
          const _SocialButton(icon: Assets.google),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Image.asset(
          icon,
          width: 22.w,
          height: 22.w,
        ),
      ),
    );
  }
}
