import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';

class UserOrders extends StatelessWidget {
  const UserOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Your Orders'.text.size(16).bold.make(),
            'See all'.text.size(14).color(blue).make().onTap(() {}),
          ],
        ),
        2.h.heightBox,
        ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              width: 40.w,
              height: 17.h,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              decoration: BoxDecoration(
                border: Border.all(color: greyShade3),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        ).box.height(17.h).make(),
      ],
    ).pSymmetric(h: 4.w, v: 2.h);
  }
}
