import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  final double height;
  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.09,
      width: width * 0.81,
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
          ).box.width(width * 0.78).make(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: black,
            ),
          ),
        ],
      ).box.make().pSymmetric(h: width * 0.03, v: height * 0.01),
    );
  }
}
