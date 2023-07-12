import 'dart:io';

import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/amazon_black_logo.png',
                  height: 5.h,
                ),
                'Add Product'.text.size(20).bold.make(),
              ],
            ).pSymmetric(h: 3.w, v: 1.h),
          ),
        ),
        body: Column(
          children: [
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) => Builder(
                builder: (context) {
                  if (productProvider.productImages.isEmpty) {
                    return Container(
                      height: 23.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: greyShade3,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_a_photo,
                            size: 7.h,
                            color: greyShade3,
                          ),
                          'Add Product'.text.size(18).color(greyShade3).make(),
                        ],
                      ),
                    ).onInkTap(
                      () {
                        context
                            .read<ProductProvider>()
                            .fetchProductImagesFromGallery(context: context);
                      },
                    );
                  } else {
                    List<File> images =
                        context.read<ProductProvider>().productImages;
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: 23.h,
                        autoPlay: true,
                        viewportFraction: 1,
                      ),
                      items: images.map((index) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: 100.h,
                              decoration: BoxDecoration(
                                color: white,
                                image: DecorationImage(
                                  image: FileImage(File(index.path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ),
            
          ],
        )
            .box
            .width(100.w)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h))
            .make(),
      ),
    );
  }
}
