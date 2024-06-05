import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.title,
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.height,
  }) : super(key: key);

  final String? title;
  final Function onTap;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor ?? AppColors.primary,
        minimumSize: Size(
          double.infinity,
          height ?? 42.h,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1.w,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.w,
          horizontal: 10.w,
        ),
      ),
      onPressed: isLoading ? () {} : () => onTap(),
      child: Builder(builder: (context) {
        if (isLoading) {
          return SizedBox(
            height: 20.h,
            width: 20.w,
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.deepOrange,
                backgroundColor: Colors.white,
              ),
            ),
          );
        }

        if (title != null) {
          return Text(
            title ?? '',
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16.sp,
            ),
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
