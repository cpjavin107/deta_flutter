


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/holiday_model.dart';


class HolidayController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<HolidayModel?> fetchProducts() async {

     HolidayModel? holiday;
     try {
       isLoading(true);
       holiday = await RemoteServices.fetchHoliday();
       if (holiday != null) {
         adsList.value = holiday.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return holiday;
   }

}