import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';

class OutlinedInputField extends StatelessWidget {
  const OutlinedInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.labelText,
    this.validator,
    this.isDisabled = false,
  });
  final String hintText;
  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                labelText ?? '',
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          TextFormField(
            enabled: !isDisabled,
            controller: controller,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 16.w,
              ),
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.black26,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.black12,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primary,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.red,
                ),
              ),
            ),
            validator: isDisabled
                ? null
                : validator ??
                    (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
          ),
        ],
      ),
    );
  }
}
