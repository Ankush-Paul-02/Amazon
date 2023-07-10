import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../user/product_screen/widgets/profile_app_bar.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(1.w, 9.h),
          child: const ProfileScreenAppBar(),
        ),
        body: 'Inventory'.text.make().centered(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: amber,
          shape: const CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: black,
          ),
        ),
      ),
    );
  }
}
