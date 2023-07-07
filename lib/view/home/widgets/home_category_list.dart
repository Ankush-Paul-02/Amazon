import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/constants.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage(
                'assets/images/categories/${categories[index]}.png',
              ),
              height: height * 0.07,
            ),
            categories[index].text.textStyle(textTheme.labelSmall).make(),
          ],
        ).box.margin(EdgeInsets.symmetric(horizontal: width * 0.02)).make();
      },
    ).box.size(width, height * 0.1).make().pSymmetric(v: height * 0.01);
  }
}
