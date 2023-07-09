import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/controller/services/user_data_crud/user_data_crud_services.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/address_screen/screens/address_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUserAddress();
      context
          .read<AddressProvider>()
          .getCurrentSelectedAddress(context: context);
    });
  }

  //! Check user address
  checkUserAddress() async {
    bool userAddressPresent =
        await UserDataCRUD.checkUserAddress(context: context);
    if (userAddressPresent == false) {
      // ignore: use_build_context_synchronously
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          height: 30.h,
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Add Address'.text.size(16).bold.make(),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 30.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: grey),
                    ),
                    alignment: Alignment.center,
                    child: Builder(builder: (context) {
                      if (index == 0) {
                        return 'Add Address'
                            .text
                            .color(greyShade3)
                            .size(14)
                            .bold
                            .make();
                      }
                      return 'Add Address'
                          .text
                          .color(greyShade3)
                          .size(14)
                          .bold
                          .make();
                    }),
                  ).onInkTap(() {
                    if (index == 0) {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const AddressScreen(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    }
                  });
                },
              ).box.height(15.h).make(),
            ],
          ),
        ),
      );
    }
  }

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
            children: [
              //! Address Bar
              const HomeScreenAddressBar(),
              CommonFunctions.divider(),
              //! Categories
              const HomeCategoryList(),
              CommonFunctions.divider(),
              //! Carousel sliders
              const HomeCarouselSliders(),
              //! Latest deals
              HomeTodaysDeal(
                todaysDealController: todaysDealController,
              ),
              1.h.heightBox,
              CommonFunctions.divider(),
              //! Latest launches
              homeOtherOfferGrid(
                      title: 'Latest launches in Headphones',
                      btnName: 'Explore More',
                      productPicNameList: headPhoneDeals,
                      offerFor: 'headPhones')
                  .box
                  .width(100.w)
                  .make()
                  .pSymmetric(h: 3.w, v: 1.h),
              1.h.heightBox,
              CommonFunctions.divider(),
              //! Insurance picture
              Image.asset(
                'assets/images/offersNsponcered/insurance.png',
                fit: BoxFit.fill,
              ).box.width(100.w).make(),
              CommonFunctions.divider(),
              1.h.heightBox,
              //! Latest launches
              homeOtherOfferGrid(
                      title: 'Minimum 70% Off | Top Offers in Clothing',
                      btnName: 'See all deals',
                      productPicNameList: clothingsDeals,
                      offerFor: 'clothing')
                  .box
                  .width(100.w)
                  .make()
                  .pSymmetric(h: 3.w, v: 1.h),
              // (height * 0.01).heightBox,
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  1.h.heightBox,
                  'Water Sixer only miniTV'
                      .text
                      .textStyle(textTheme.bodyMedium)
                      .semiBold
                      .make()
                      .pSymmetric(h: 3.w),
                  Image.asset(
                    'assets/images/offersNsponcered/sixer.png',
                    fit: BoxFit.fill,
                  ).box.width(100.w).make().pSymmetric(h: 3.w, v: 1.h),
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
