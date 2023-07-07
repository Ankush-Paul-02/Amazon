import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';

class ProfileScreenAppBar extends StatelessWidget {
  const ProfileScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 9.h,
      width: 81.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/amazon_black_logo.png',
            height: 5.h,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: black,
              size: 3.5.h,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: black,
              size: 3.5.h,
            ),
          )
        ],
      ).pSymmetric(h: 3.w, v: 1.h),
    );
  }
}
