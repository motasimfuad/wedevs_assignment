import 'package:flutter/material.dart';
import 'package:motasimfuad_wedevs/src/features/authentication/sign_up/views/sign_up_screen.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
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
                  controller: TextEditingController(),
                  hintText: 'Username',
                ),
                const SizedBox(height: 16),
                OutlinedInputField(
                  controller: TextEditingController(),
                  hintText: 'Password',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
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
        ],
      ),
    );
  }
}
