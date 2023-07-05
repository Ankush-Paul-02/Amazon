import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By Continuing you agree to Amazon\'s ',
            style: textTheme.labelMedium,
          ),
          TextSpan(
            text: 'Conditions of use ',
            style: textTheme.labelMedium!.copyWith(color: blue),
          ),
          TextSpan(
            text: 'and ',
            style: textTheme.labelMedium,
          ),
          TextSpan(
            text: 'Privacy Notice.',
            style: textTheme.labelMedium!.copyWith(color: blue),
          ),
        ],
      ),
    ).pSymmetric(h: width * 0.03);
  }
}
