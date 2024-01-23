


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/adsfirst.dart';
import '../models/member_model.dart';

class MemberController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<List<Data>> fetchProducts() async {

     var company;
     try {
       isLoading(true);
       company = await RemoteServices.fetchMembers();
       if (company != null) {
         adsList.value = company.data;
       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return company.data;
   }

}