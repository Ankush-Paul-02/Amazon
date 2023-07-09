import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../utils/colors.dart';

class AddressScreenAppBar extends StatelessWidget {
  const AddressScreenAppBar({
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/amazon_black_logo.png',
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
