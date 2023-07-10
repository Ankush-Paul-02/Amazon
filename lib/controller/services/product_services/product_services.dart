// ignore_for_file: use_build_context_synchronously, avoid_function_literals_in_foreach_calls
import 'dart:io';
import 'package:amazon/constants/constants.dart';
import 'package:amazon/controller/provider/product_provider/product_provider.dart';
import 'package:amazon/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductServices {
  //! Get image from gallery
  static Future getImages({required BuildContext context}) async {
    List<File> selectedImages = [];
    final pickedFile = await picker.pickMultiImage(imageQuality: 100);

    List<XFile> filePick = pickedFile;

    if (filePick.isNotEmpty) {
      for (var i = 0; i < filePick.length; i++) {
        selectedImages.add(File(filePick[i].path));
      }
    } else {
      VxToast.show(context, msg: "No Image Selected");
    }
    return selectedImages;
  }

  //! Upload image to firebase
  static uploadImageToFirebase({
    required BuildContext context,
    required List<File> images,
  }) async {
    List<String> imagesUrl = [];
    String sellerId = auth.currentUser!.phoneNumber!;
    Uuid uuid = const Uuid();

    //! push file and generate url
    await Future.forEach(images, (image) async {
      String imageName = '$sellerId${uuid.v1().toString()}';

      Reference ref = storage.ref().child('Product_Images').child(imageName);
      await ref.putFile(File(image.path));

      String imageUrl = await ref.getDownloadURL();
      imagesUrl.add(imageUrl);
    });

    context.read<ProductProvider>().updateProductImageURL(imageURLs: imagesUrl);
  }

  //! Get seller products
  static Future<List<ProductModel>> getSellersProducts(
      {required BuildContext context}) async {
    List<ProductModel> sellerProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('Products')
          .orderBy('uploadAt', descending: true)
          .where('productSellerId', isEqualTo: auth.currentUser!.phoneNumber)
          .get();
      snapshot.docs.forEach((element) {
        sellerProducts.add(
          ProductModel.fromMap(
            element.data(),
          ),
        );
      });
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return sellerProducts;
  }
}
