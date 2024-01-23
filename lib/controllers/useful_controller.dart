


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/useful_model.dart';


class UsefulController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<UsefulModel?> fetchProducts() async {

     UsefulModel? links;
     try {
       isLoading(true);
       links = await RemoteServices.fetchUseful();
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