


import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/update_member.dart';


class UpdateMemberController extends GetxController {
  String? company_id;
  var isLoading = true.obs;



  Future<UpdateMemberModel?> fetchProducts(String id,String name,String lifeline,String spouse,String father
      ,String mother,String dob,String join,String anniversary,String present,String office,
      String permanent,String mobile,String email,String other) async {

    UpdateMemberModel? enquiry;
    try {
      isLoading(true);
      enquiry = await RemoteServices.UpdateMember( id,name, lifeline, spouse, father, mother, dob,
          join, anniversary, present, office, permanent,mobile,email,other);


    }catch (exception){
      isLoading(false);
      print(exception);
    }

    print(enquiry?.msg);
  }

}