import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/memberprofile_model.dart';


class MemberProfileController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<MemberProfileModel?> fetchProducts(String value) async {

     MemberProfileModel? profile;
     try {
       isLoading(true);
       profile = await RemoteServices.fetchProfile(value);
       if (profile != null) {
         adsList.value = profile.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return profile;
   }

}