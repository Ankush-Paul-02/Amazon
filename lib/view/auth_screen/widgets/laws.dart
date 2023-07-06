import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class Laws extends StatelessWidget {
  const Laws({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 1,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [white, grey, white]),
          ),
        ),
        (height * 0.03).heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            'Condition Of Use'.text.size(16).color(blue).make(),
            'Privacy Notice'.text.size(16).color(blue).make(),
            'Help'.text.size(16).color(blue).make(),
          ],
        ),
        (height * 0.01).heightBox,
        '@ 1996-2023, Amazon.com, Inc. or its affiliates'
            .text
            .align(TextAlign.center)
            .size(14)
            .make(),
      ],
    );
  }
}
