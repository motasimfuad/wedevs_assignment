import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/root/widgets/social_login_buttons.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/controllers/sign_in_view_controller.dart';
import 'package:motasimfuad_wedevs/src/routes/app_pages.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

class SignInScreen extends GetView<SignInViewController> {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Image.asset(
                Assets.logo,
                width: 161.w,
              ),
              SizedBox(height: 80.h),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.h),
              OutlinedInputField(
                controller: controller.usernameController,
                hintText: 'Username',
                prefixIcon: Icons.person_2_outlined,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              Obx(
                () => PrimaryButton(
                  title: 'Login',
                  height: 61.h,
                  isLoading: controller.isLoading,
                  onTap: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    controller.signIn();
                  },
                ),
              ),
              SizedBox(height: 40.h),
              const SocialLoginButtons(),
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.signup);
                },
                child: Text(
                  'Create New Account',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
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
