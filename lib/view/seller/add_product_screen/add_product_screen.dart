// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:amazon/model/product_model.dart';
import 'package:amazon/view/seller/add_product_screen/widgets/product_details_common_text_field.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../constants/constants.dart';
import '../../../utils/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController manufacturerNameController = TextEditingController();
  TextEditingController specificationController = TextEditingController();
  TextEditingController countryOfOriginController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discountedPriceController = TextEditingController();
  TextEditingController productIDController = TextEditingController();

  String dropDownValue = 'Select Category';
  bool addProductBtnPressed = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      addProductBtnPressed = false;
    });
  }

  onPressed() async {
  final productProvider = context.read<ProductProvider>();
  if (productProvider.productImages.isNotEmpty) {
    setState(() {
      addProductBtnPressed = true;
    });

    await ProductServices.uploadImageToFirebaseStorage(
        context: context, images: context.read<ProductProvider>().productImages);

    const uuid = Uuid();
    String? sellerId = auth.currentUser?.phoneNumber; // Use null-aware operator

    if (sellerId != null) {
      final productId = '$sellerId${uuid.v1()}';
      final imagesURL = productProvider.productImagesURL;

      final productModel = ProductModel(
        imagesURL: imagesURL,
        name: nameController.text.trim(),
        category: dropDownValue,
        description: descriptionController.text.trim(),
        brandName: brandNameController.text.trim(),
        manufacturerName: manufacturerNameController.text.trim(),
        countryOfOrigin: countryOfOriginController.text.trim(),
        specifications: specificationController.text.trim(),
        price: double.parse(priceController.text.trim()),
        productID: productId,
        productSellerID: sellerId,
        inStock: true,
      );

      await ProductServices.addProduct(
        context: context,
        productModel: productModel,
      );
    }
  }
}


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
            2.heightBox,
            productDetails(),
            4.heightBox,
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: amber,
                minimumSize: Size(
                  100.w,
                  6.h,
                ),
              ),
              child: addProductBtnPressed
                  ? CircularProgressIndicator(
                      color: white,
                    )
                  : 'Add Product'.text.semiBold.black.size(16).make(),
            ),
          ],
        )
            .box
            .width(100.w)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h))
            .make()
            .scrollVertical(),
      ),
    );
  }

  Column productDetails() {
    return Column(
      children: [
        AddProductCommonTextField(
            controller: nameController, hintText: 'Enter product name'),
        productCategoryDropdown(),
        AddProductCommonTextField(
            controller: descriptionController,
            hintText: 'Enter product description'),
        AddProductCommonTextField(
            controller: brandNameController, hintText: 'Enter brand name'),
        AddProductCommonTextField(
            controller: manufacturerNameController,
            hintText: 'Enter manufacturer name'),
        AddProductCommonTextField(
            controller: countryOfOriginController,
            hintText: 'Enter country name'),
        AddProductCommonTextField(
            controller: discountedPriceController,
            hintText: 'Enter product price'),
      ],
    );
  }

  Column productCategoryDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
          value: dropDownValue,
          underline: const SizedBox(),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: productCategories.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                dropDownValue = newValue;
              });
            }
          },
        )
            .box
            .margin(EdgeInsets.only(top: 2.h))
            .border(color: grey)
            .width(100.w)
            .padding(EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.h))
            .withRounded(value: 5)
            .make(),
      ],
    );
  }
}
