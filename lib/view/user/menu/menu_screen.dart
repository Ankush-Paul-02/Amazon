import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../home/widgets/home_page_app_bar.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: const HomePageAppBar(),
        ),
        body: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const PageScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: 18,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: greyShade3),
                    image: DecorationImage(
                      image: AssetImage('assets/images/menu_pics/$index.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            1.h.heightBox,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const PageScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 6.h,
                  width: 100.w,
                  margin: EdgeInsets.symmetric(vertical: 0.5.h),
                  padding:
                      EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: teal),
                    color: white,
                  ),
                  child: Row(
                    children: [
                      index == 0
                          ? 'Settings'
                              .text
                              .textStyle(textTheme.bodySmall)
                              .make()
                          : 'Customer Service'
                              .text
                              .textStyle(textTheme.bodySmall)
                              .make(),
                      const Spacer(),
                      Icon(Icons.chevron_right_rounded, color: black)
                    ],
                  ),
                );
              },
            ),
            3.h.heightBox,
          ],
        )
            .box
            .width(100.w)
            .linearGradient(appBarGradientColor,
                begin: Alignment.centerLeft, end: Alignment.centerRight)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h))
            .make()
            .scrollVertical(),
      ),
    );
  }
}
