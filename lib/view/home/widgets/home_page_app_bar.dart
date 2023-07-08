import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 9.h,
      width: 81.w,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: appBarGradientColor,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            onTap: () {},
            cursorColor: black,
            textAlign: TextAlign.left,
            style: textTheme.bodySmall,
            decoration: InputDecoration(
              fillColor: white,
              filled: true,
              hintText: 'Search Amazon.in',
              prefixIcon: Icon(
                Icons.search,
                color: black,
              ),
              suffixIcon: Icon(
                Icons.camera_alt_rounded,
                color: grey,
              ),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: grey),
              ),
            ),
          ).box.width(78.w).make(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: black,
            ),
          ),
        ],
      ).box.make().pSymmetric(h: 3.w, v: 1.h),
    );
  }
}
