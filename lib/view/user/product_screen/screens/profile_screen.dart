import 'package:amazon/constants/common_functions.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/buy_again.dart';
import '../widgets/keep_shopping.dart';
import '../widgets/profile_4_section.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_info.dart';
import '../widgets/user_orders.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: const ProfileScreenAppBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Profile Info section
              const ProfileInfoSection(),
              2.h.heightBox,
              //! 4 section part
              const Profile4SectionPart(),
              //! Your Orders
              const UserOrders(),
              CommonFunctions.divider(),
              //! Keep Shopping for
              const KeepShopping(),
              1.h.heightBox,
              CommonFunctions.divider(),
              //! Buy Again
              const BuyAgain(),
            ],
          ).box.make().pSymmetric(v: 1.h),
        ),
      ),
    );
  }
}
