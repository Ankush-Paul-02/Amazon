import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({
    super.key,
    required this.height,
    required this.inLogin,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final bool inLogin;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! Check Box
        Icon(
          Icons.circle,
          size: height * 0.015,
          color: inLogin ? transparent : secondaryColor,
        )
            .box
            .roundedFull
            .white
            .size(height * 0.03, height * 0.03)
            .border(color: grey)
            .make(),
        (width * 0.02).widthBox,
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Create Account. ',
                style: textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'New to Amazon?',
                style: textTheme.bodySmall,
              ),
            ],
          ),
        )
      ],
    );
  }
}
