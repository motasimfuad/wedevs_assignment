import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:motasimfuad_wedevs/src/widgets/outlined_input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                OutlinedInputField(
                  controller: TextEditingController(),
                  hintText: 'Name',
                ),
                const SizedBox(height: 16),
                OutlinedInputField(
                  controller: TextEditingController(),
                  hintText: 'Email',
                ),
                const SizedBox(height: 16),
                OutlinedInputField(
                  controller: TextEditingController(),
                  hintText: 'Password',
                ),
                const SizedBox(height: 16),
                OutlinedInputField(
                  controller: TextEditingController(),
                  hintText: 'Confirm Password',
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
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
                            Navigator.pop(context);
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
        ],
      ),
    );
  }
}
