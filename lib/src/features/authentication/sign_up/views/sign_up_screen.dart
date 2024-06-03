import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/controllers/sign_up_view_controller.dart';
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
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              OutlinedInputField(
                controller: controller.nameController,
                hintText: 'Name',
              ),
              const SizedBox(height: 16),
              OutlinedInputField(
                controller: controller.emailController,
                hintText: 'Email',
              ),
              const SizedBox(height: 16),
              OutlinedInputField(
                controller: controller.passwordController,
                hintText: 'Password',
              ),
              const SizedBox(height: 16),
              OutlinedInputField(
                controller: controller.confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              const SizedBox(height: 32),
              Obx(
                () => PrimaryButton(
                  title: 'Sign Up',
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
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.back();
                        },
                      text: 'Sign In',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
