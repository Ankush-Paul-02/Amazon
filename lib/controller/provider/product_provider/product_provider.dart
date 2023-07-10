import 'dart:io';
import 'package:amazon/controller/services/product_services/product_services.dart';
import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<File> productImages = [];
  List<String> productImagesUrl = [];
  List<ProductModel> products = [];
  bool sellerProductsFetched = false;

  //! Get image from gallery
  fetchProductImagesFromGallery({required BuildContext context}) async {
    productImages = await ProductServices.getImages(context: context);
    notifyListeners();
  }

  //! Update product image url
  updateProductImageURL({required List<String> imageURLs}) async {
    productImagesUrl = imageURLs;
    notifyListeners();
  }

  //! Fetch seller products
  fetchSellerProducts({required BuildContext context}) async {
    products = await ProductServices.getSellersProducts(context: context);
    sellerProductsFetched = true;
    notifyListeners();
  }

  emptyProductImagesList() {
    productImages = [];
    notifyListeners();
  }
}
