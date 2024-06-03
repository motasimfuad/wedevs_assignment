import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_in/controllers/sign_in_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/views/sign_up_screen.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';
import 'package:motasimfuad_wedevs/src/widgets/primary_button.dart';

class SignInScreen extends GetView<SignInViewController> {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  OutlinedInputField(
                    controller: controller.usernameController,
                    hintText: 'Username',
                  ),
                  const SizedBox(height: 16),
                  OutlinedInputField(
                    controller: controller.passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 32),
                  Obx(
                    () => PrimaryButton(
                      title: 'Sign In',
                      isLoading: controller.isLoading,
                      onTap: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }

                        controller.signIn();
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const SignUpScreen();
                        }),
                      );
                    },
                    child: const Text(
                      'Create New Account',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
