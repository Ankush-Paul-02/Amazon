import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/constants.dart';
import '../../../utils/colors.dart';

class HomeTodaysDeal extends StatelessWidget {
  const HomeTodaysDeal({
    super.key,
    required this.todaysDealController,
  });

  final CarouselController todaysDealController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        '50% - 80% off | Latest deals'
            .text
            .textStyle(textTheme.bodyLarge)
            .bold
            .make(),
        CarouselSlider(
          carouselController: todaysDealController,
          options: CarouselOptions(
            height: height * 0.23,
            autoPlay: true,
            viewportFraction: 1,
          ),
          items: todaysDeal.map((index) {
            return Builder(
              builder: (context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: white,
                    image: DecorationImage(
                      image: AssetImage('assets/images/todays_deals/$index'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        (height * 0.01).heightBox,
        Row(
          children: [
            'Up to 62% Off'
                .text
                .color(white)
                .textStyle(textTheme.labelMedium)
                .make()
                .p(5)
                .box
                .color(red)
                .withRounded(value: 5)
                .make(),
            (width * 0.03).widthBox,
            'Deal of the Day'
                .text
                .semiBold
                .color(red)
                .textStyle(textTheme.labelMedium)
                .make(),
          ],
        ),
        (height * 0.01).heightBox,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: greyShade3),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/todays_deals/${todaysDeal[index]}'),
                ),
              ),
            ).onTap(() => todaysDealController.animateToPage(index));
          },
        ),
        (height * 0.01).heightBox,
        'See all deals'
            .text
            .color(blue)
            .textStyle(textTheme.labelMedium)
            .make()
            .onTap(() {}),
      ],
    ).box.width(width).make().pSymmetric(h: width * 0.03, v: height * 0.01);
  }
}
