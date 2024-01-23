import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/getenquiry_model.dart';


class EnquiryController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<EnquiryModel?> fetchProducts() async {

     EnquiryModel? enquiry;
     try {
       isLoading(true);
       enquiry = await RemoteServices.fetchEnquiry();
       if (enquiry != null) {
         adsList.value = enquiry.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return enquiry;
   }

}