


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/adsfirst.dart';

class AdsController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Ads>[].obs;

   Future<List<Ads>> fetchProducts() async {

     var company;
     try {
       isLoading.value = true;
       company = await RemoteServices.fetchFilters();
       if (company != null) {
         adsList.value = company.ads;
         isLoading.value = false;
       }
     }catch (exception){
       isLoading.value = false;
       // isLoading(false);
       print(exception);
     }
     return company.ads;
   }



  // void fetchProducts() async {
  //   try {
  //     isLoading(true);
  //     var company = await RemoteServices.fetchFilters();
  //     if(company!=null){
  //       adsList.value = company.ads;
  //
  //     }
  //
  //   } finally {
  //     isLoading(false);
  //   }
  // }



}