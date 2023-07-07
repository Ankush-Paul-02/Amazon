import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            'Keep Shopping for'.text.size(16).bold.make(),
            'Browsing history'
                .text
                .size(14)
                .overflow(TextOverflow.ellipsis)
                .color(blue)
                .make()
                .onTap(() {}),
          ],
        ),
        2.h.heightBox,
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemCount: 5,
          shrinkWrap: true,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 40.w,
                    height: 17.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyShade3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                'Product'.text.size(14).make().pSymmetric(h: 2.w),
              ],
            );
          },
        ),
      ],
    ).pSymmetric(h: 4.w, v: 1.h);
  }
}
