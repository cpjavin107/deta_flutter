


import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/addenquiry_model.dart';


class AddEnquiryController extends GetxController {
   String? company_id;
  var isLoading = true.obs;


   Future<AddEnquiryModel?> fetchProducts(String title,String name,String mobile,String desc) async {

     AddEnquiryModel? enquiry;
     try {
       isLoading(true);
       enquiry = await RemoteServices.addEnquiry(title,name,mobile,desc);


     }catch (exception){
       isLoading(false);
       print(exception);
     }

     print(enquiry?.msg);
   }

}