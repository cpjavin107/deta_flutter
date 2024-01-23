


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/contact_model.dart';


class ContactController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<ContactModel?> fetchProducts(String value) async {

     ContactModel? links;
     try {
       isLoading(true);
       links = await RemoteServices.fetchContact(value);
       if (links != null) {
         adsList.value = links.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return links;
   }

}