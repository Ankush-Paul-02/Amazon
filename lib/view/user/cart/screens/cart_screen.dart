import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../home/widgets/home_page_app_bar.dart';
import '../widgets/cart_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: const HomePageAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    //! Total price
                    TextSpan(text: 'Subtotal ', style: textTheme.bodyLarge),
                    TextSpan(
                      text: '₹ 9999',
                      style: textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              1.h.heightBox,
              //! Description
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: teal,
                  ),
                  1.w.widthBox,
                  Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Your order is eligible for free delivery. ',
                              style:
                                  textTheme.labelMedium!.copyWith(color: teal),
                            ),
                            TextSpan(
                              text: 'Select this option at checkout. ',
                              style: textTheme.labelMedium,
                            ),
                            TextSpan(
                              text: 'Details',
                              style:
                                  textTheme.labelMedium!.copyWith(color: teal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).expand(),
                ],
              ).box.height(10.h).make(),
              //! Proceed to buy button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: amber,
                  minimumSize: Size(100.w, 6.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {},
                child: 'Proceed to Buy'
                    .text
                    .size(16)
                    .black
                    .make()
                    .pSymmetric(v: 2.h),
              ),
              2.h.heightBox,
              CommonFunctions.divider(),
              2.h.heightBox,
              //! Carts
              const CartsSection(),
            ],
          ),
        ).box.size(100.w, 100.h).make().pSymmetric(h: 3.w, v: 2.h),
      ),
    );
  }
}
