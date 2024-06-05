import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/root/widgets/social_login_buttons.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/controllers/sign_up_view_controller.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

class SignUpScreen extends GetView<SignUpViewController> {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 121.w,
                      width: 121.w,
                      child: Card(
                        elevation: 4,
                        color: Colors.white,
                        shadowColor: Colors.black.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.w),
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.dashboardTab4,
                            height: 31.w,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.w,
                      right: 5.w,
                      child: Container(
                          height: 34.w,
                          width: 34.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500.w),
                            gradient: const LinearGradient(
                              colors: AppColors.primaryGradient,
                            ),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 14.sp,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              OutlinedInputField(
                controller: controller.nameController,
                hintText: 'Name',
                prefixIcon: Icons.person_outline,
                backgroundColor: Colors.white,
                showBorder: false,
              ),
              OutlinedInputField(
                controller: controller.emailController,
                hintText: 'Email',
                prefixIcon: Icons.email_outlined,
                backgroundColor: Colors.white,
                showBorder: false,
              ),
              OutlinedInputField(
                controller: controller.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                backgroundColor: Colors.white,
                showBorder: false,
                isPassword: true,
              ),
              OutlinedInputField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm Password',
                prefixIcon: Icons.lock_outline,
                backgroundColor: Colors.white,
                showBorder: false,
                isPassword: true,
              ),
              SizedBox(height: 60.h),
              Obx(
                () => PrimaryButton(
                  title: 'Sign Up',
                  height: 61.h,
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    if (controller.passwordController.text !=
                        controller.confirmPasswordController.text) {
                      Get.snackbar(
                        'Error',
                        'Passwords do not match.',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }

                    controller.signUp();
                  },
                ),
              ),
              const SizedBox(height: 40),
              const SocialLoginButtons(),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      text: ' Login',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
