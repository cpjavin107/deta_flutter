


import 'package:flutter/widgets.dart';

import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/committee_model.dart';

class ExCommitteeController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<Member2Data?> fetchProducts() async {

     Member2Data? company;
     try {
       isLoading(true);
       company = await RemoteServices.fetchCommittee();
       debugPrint("***************************************************");
       debugPrint("${company!.data!.length}");
       debugPrint("***************************************************");


       if (company != null) {
         adsList.value = company.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return company;
   }

}