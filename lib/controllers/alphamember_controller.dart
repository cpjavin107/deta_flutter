
import '../helper/remote_services.dart';
import 'package:get/get.dart';
import '../models/alphasearchmember_model.dart';


class AlphaMemberController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<AlphaMemberModel?> fetchProducts(String member,String value) async {
     AlphaMemberModel? holiday;
     try {
       isLoading(true);
       holiday = await RemoteServices.fetchAlphaMember(member,value);
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