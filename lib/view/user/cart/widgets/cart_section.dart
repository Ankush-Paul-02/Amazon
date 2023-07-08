import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';

class CartsSection extends StatelessWidget {
  const CartsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      itemCount: 2,
      physics: const PageScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: greyShade1,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage(
                          'assets/images/todays_deals/todaysDeal1.png'),
                      fit: BoxFit.fitWidth,
                    ),
                    1.h.heightBox,
                    Container(
                      height: 6.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: greyShade3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.remove, color: black)
                              .box
                              .withDecoration(
                                BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: greyShade3),
                                  ),
                                ),
                              )
                              .make()
                              .expand(flex: 2),
                          '1'
                              .text
                              .make()
                              .centered()
                              .box
                              .white
                              .make()
                              .expand(flex: 3),
                          Icon(Icons.add, color: black)
                              .box
                              .withDecoration(
                                BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: greyShade3),
                                  ),
                                ),
                              )
                              .make()
                              .expand(flex: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              2.w.widthBox,
              Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Product name'.text.textStyle(textTheme.bodySmall).make(),
                    1.h.heightBox,
                    '₹ 46,499'
                        .text
                        .textStyle(textTheme.displaySmall)
                        .bold
                        .make(),
                    0.5.h.heightBox,
                    'Eligible for free shipping'
                        .text
                        .color(grey)
                        .textStyle(textTheme.labelSmall)
                        .make(),
                    0.5.h.heightBox,
                    'In stock'
                        .text
                        .color(teal)
                        .textStyle(textTheme.labelSmall)
                        .make(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            backgroundColor: white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: greyShade3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: 'Delete'.text.size(12).black.make(),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            backgroundColor: white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: greyShade3),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onPressed: () {},
                          child: 'Save for Later'.text.size(12).black.make(),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
