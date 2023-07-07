import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/constants.dart';
import '../widgets/home_address_bar.dart';
import '../widgets/home_carousel_sliders.dart';
import '../widgets/home_category_list.dart';
import '../widgets/home_page_app_bar.dart';
import '../widgets/home_todays_deal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealController = CarouselController();
  headPhonesDeals(int index) {
    switch (index) {
      case 0:
        return "Bose";
      case 1:
        return "BoAt";
      case 2:
        return "Sony";
      case 3:
        return "OnePlus";
      default:
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return 'Kurtas, Sarees & more';
      case 1:
        return 'Tops, dresses & more';
      case 2:
        return 'T-Shirt, jeans & more';
      case 3:
        return 'View all';
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.09),
          child: HomePageAppBar(
              height: height, width: width, textTheme: textTheme),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Address Bar
              const HomeScreenAddressBar(),
              CommonFunctions.divider(),
              //! Categories
              const HomeCategoryList(),
              CommonFunctions.divider(),
              //! Carousel sliders
              HomeCarouselSliders(height: height),
              //! Latest deals
              HomeTodaysDeal(
                todaysDealController: todaysDealController,
              ),
              (height * 0.01).heightBox,
              CommonFunctions.divider(),
              //! Latest launches
              homeOtherOfferGrid(
                      title: 'Latest launches in Headphones',
                      btnName: 'Explore More',
                      productPicNameList: headPhoneDeals,
                      offerFor: 'headPhones')
                  .box
                  .width(width)
                  .make()
                  .pSymmetric(h: width * 0.03, v: height * 0.01),
              (height * 0.01).heightBox,
              CommonFunctions.divider(),
              //! Insurance picture
              Image.asset(
                'assets/images/offersNsponcered/insurance.png',
                fit: BoxFit.fill,
              ).box.width(width).make(),
              CommonFunctions.divider(),
              (height * 0.01).heightBox,
              //! Latest launches
              homeOtherOfferGrid(
                      title: 'Minimum 70% Off | Top Offers in Clothing',
                      btnName: 'See all deals',
                      productPicNameList: clothingsDeals,
                      offerFor: 'clothing')
                  .box
                  .width(width)
                  .make()
                  .pSymmetric(h: width * 0.03, v: height * 0.01),
              // (height * 0.01).heightBox,
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (height * 0.01).heightBox,
                  'Water Sixer only miniTV'
                      .text
                      .textStyle(textTheme.bodyMedium)
                      .semiBold
                      .make()
                      .pSymmetric(h: width * 0.03),
                  Image.asset(
                    'assets/images/offersNsponcered/sixer.png',
                    fit: BoxFit.fill,
                  )
                      .box
                      .width(width)
                      .make()
                      .pSymmetric(h: width * 0.03, v: height * 0.01),
                ],
              ),
            ],
          ),
        ),
        // bottomNavigationBar: const UserBottomNavBar(),
      ),
    );
  }

  Column homeOtherOfferGrid(
      {required String title,
      required String btnName,
      required List<String> productPicNameList,
      required String offerFor}) {
    final height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title.text.textStyle(textTheme.bodyLarge).bold.make(),
        (height * 0.01).heightBox,
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/offersNsponcered/${productPicNameList[index]}'),
                    ),
                  ),
                ).expand(),
                Text(
                  offerFor == 'headPhones'
                      ? headPhonesDeals(index)
                      : clothingDeals(index),
                  style: textTheme.labelSmall,
                ),
              ],
            ).expand();
          },
        ),
        btnName.text
            .color(blue)
            .textStyle(textTheme.labelMedium)
            .make()
            .onTap(() {}),
      ],
    );
  }
}
