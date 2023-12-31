import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/constants.dart';
import '../../../utils/colors.dart';

class HomeCarouselSliders extends StatelessWidget {
  const HomeCarouselSliders({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 23.h,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: carouselPictures.map((index) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: amber,
                image: DecorationImage(
                  image: AssetImage('assets/images/carousel_slideshow/$index'),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
