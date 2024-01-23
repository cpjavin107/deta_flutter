


import 'package:deta/models/adssecond.dart';

import '../helper/remote_services.dart';
import 'package:get/get.dart';


class AdsTwoController extends GetxController {
  String? member_id;
  var isLoading = true.obs;
  var adsList = <Ads>[].obs;


   Future<List<Ads>> fetchProducts(String member_id) async {

     var company;
     try {
       isLoading(true);
       company = await RemoteServices.fetchAds(member_id);
       if (company != null) {
         adsList.value = company.ads;
       }
     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return company.ads;
   }

}