import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';

class OutlinedInputField extends StatefulWidget {
  const OutlinedInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.labelText,
    this.validator,
    this.isDisabled = false,
    this.prefixIcon,
    this.backgroundColor,
    this.showBorder = true,
    this.isPassword = false,
  });
  final String hintText;
  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool isDisabled;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final bool showBorder;
  final bool isPassword;

  @override
  State<OutlinedInputField> createState() => _OutlinedInputFieldState();
}

class _OutlinedInputFieldState extends State<OutlinedInputField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelText != null)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text(
                widget.labelText ?? '',
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                if (!widget.showBorder)
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: TextFormField(
              enabled: !widget.isDisabled,
              controller: widget.controller,
              decoration: InputDecoration(
                filled: widget.backgroundColor != null,
                fillColor: widget.backgroundColor,
                prefixIconColor: AppColors.grey,
                prefixIcon: (widget.prefixIcon != null)
                    ? Icon(widget.prefixIcon)
                    : null,
                suffixIcon: widget.isPassword ? _passwordSuffix() : null,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 16.w,
                ),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: !widget.showBorder
                      ? BorderSide.none
                      : const BorderSide(
                          width: 1,
                          color: Colors.black12,
                        ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: !widget.showBorder
                      ? BorderSide.none
                      : const BorderSide(
                          width: 1,
                          color: Colors.black12,
                        ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: !widget.showBorder
                      ? BorderSide.none
                      : const BorderSide(
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
              obscureText: widget.isPassword ? !showPassword : false,
              validator: widget.isDisabled
                  ? null
                  : widget.validator ??
                      (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
            ),
          ),
        ],
      ),
    );
  }

  IconButton _passwordSuffix() {
    return IconButton(
      onPressed: () {
        setState(() {
          showPassword = !showPassword;
        });
      },
      icon: Icon(
        !showPassword
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: AppColors.grey,
        size: 20.w,
      ),
    );
  }
}
