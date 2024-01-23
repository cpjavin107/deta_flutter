


import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/update_member.dart';


class DeleteChildController extends GetxController {
  String? company_id;
  var isLoading = true.obs;

  Future<UpdateMemberModel?> fetchProducts(String id) async {
    UpdateMemberModel? enquiry;
    try {
      isLoading(true);
      enquiry = await RemoteServices.ChildrenDelete(id);

    }catch (exception){
      isLoading(false);
      print(exception);
    }

    print(enquiry?.msg);
  }

}