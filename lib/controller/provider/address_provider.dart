import 'package:amazon/controller/services/user_data_crud/user_data_crud_services.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/widgets.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> addressModel = [];
  AddressModel currentAddress = AddressModel();
  bool fetchedCurrentAddress = false;
  bool fetchedAllAddress = false;
  bool isPresentAddress = false;

  //! Get address provider
  getAllAddress({required BuildContext context}) async {
    addressModel = await UserDataCRUD.getAllAddress(context: context);
    fetchedAllAddress = true;
    notifyListeners();
  }

  //! Get current selected address
  getCurrentSelectedAddress({required BuildContext context}) async {
    currentAddress = await UserDataCRUD.getCurrentAddress(context: context);
    isPresentAddress = await UserDataCRUD.checkUserAddress(context: context);
    fetchedCurrentAddress = true;
    notifyListeners();
  }
}
