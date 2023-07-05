import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class SignInContinueButton extends StatelessWidget {
  const SignInContinueButton({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

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
      onPressed: () {},
      child: 'Continue'.text.textStyle(textTheme.displaySmall).make(),
    ).pSymmetric(h: width * 0.03);
  }
}
