import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class SignInContinueButton extends StatelessWidget {
  const SignInContinueButton({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
    required this.text,
    required this.onTap,
  });

  final double width;
  final double height;
  final TextTheme textTheme;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width * 8, height * 0.06),
        backgroundColor: amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: onTap,
      child: text.text.textStyle(textTheme.bodyMedium).make(),
    );
  }
}
