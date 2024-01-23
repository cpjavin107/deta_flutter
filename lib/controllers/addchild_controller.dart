


import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/update_member.dart';


class AddChildController extends GetxController {
  String? company_id;
  var isLoading = true.obs;

  Future<UpdateMemberModel?> fetchProducts(String id,String name,String remark) async {
    UpdateMemberModel? enquiry;
    try {
      isLoading(true);
      enquiry = await RemoteServices.Children(id,name,remark);

    }catch (exception){
      isLoading(false);
      print(exception);
    }

    print(enquiry?.msg);
  }

}