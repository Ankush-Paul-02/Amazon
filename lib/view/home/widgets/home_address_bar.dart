import 'package:amazon/controller/provider/address_provider.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utils/colors.dart';

class HomeScreenAddressBar extends StatelessWidget {
  const HomeScreenAddressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Consumer<AddressProvider>(
        builder: (context, addressProvider, child) {
          if (addressProvider.fetchedCurrentAddress == true) {
            AddressModel selectedAddress = addressProvider.currentAddress;
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_pin, color: black, size: 6.w),
                2.w.widthBox,
                'Deliver to ${selectedAddress.name} - ${selectedAddress.town}, ${selectedAddress.state}'
                    .text
                    .size(2.w)
                    .semiBold
                    .overflow(TextOverflow.ellipsis)
                    .make(),
              ],
            ).pSymmetric(h: 3.w);
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_pin, color: black),
              2.w.widthBox,
              'Deliver to user - city, state}'
                  .text
                  .size(2.w)
                  .semiBold
                  .overflow(TextOverflow.ellipsis)
                  .make(),
            ],
          ).pSymmetric(h: 3.w);
        },
      ),
    );
  }
}
