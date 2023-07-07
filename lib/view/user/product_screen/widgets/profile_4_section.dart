import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../utils/colors.dart';

class Profile4SectionPart extends StatelessWidget {
  const Profile4SectionPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3.4,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: grey),
            borderRadius: BorderRadius.circular(50),
            color: greyShade2,
          ),
          alignment: Alignment.center,
          child: Builder(
            builder: (context) {
              if (index == 0) {
                return 'Your Orders'
                    .text
                    .textStyle(textTheme.bodyMedium)
                    .make();
              } else if (index == 1) {
                return 'Buy Again'.text.textStyle(textTheme.bodyMedium).make();
              } else if (index == 2) {
                return 'Your Account'
                    .text
                    .textStyle(textTheme.bodyMedium)
                    .make();
              }
              return 'Your Wish List'
                  .text
                  .textStyle(textTheme.bodyMedium)
                  .make();
            },
          ),
        );
      },
    );
  }
}
