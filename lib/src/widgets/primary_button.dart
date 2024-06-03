import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.title,
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor,
  }) : super(key: key);

  final String? title;
  final Function onTap;
  final bool isLoading;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
        backgroundColor: backgroundColor ?? Colors.deepOrange,
        minimumSize: const Size(double.infinity, 42),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
      ),
      onPressed: isLoading ? () {} : () => onTap(),
      child: Builder(builder: (context) {
        if (isLoading) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.deepOrange,
                backgroundColor: Colors.white,
              ),
            ),
          );
        }

        if (title != null) {
          return Text(title ?? '');
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
