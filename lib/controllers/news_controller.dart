


import '../helper/remote_services.dart';
import 'package:get/get.dart';

import '../models/news_model.dart';


class NewsController extends GetxController {
   String? company_id;
  var isLoading = true.obs;
  var adsList = <Data>[].obs;


   Future<NewsModel?> fetchProducts() async {

     NewsModel? news;
     try {
       isLoading(true);
       news = await RemoteServices.fetchNews();
       if (news != null) {
         adsList.value = news.data!;

       }

     }catch (exception){
       isLoading(false);
       print(exception);
     }

     return news;
   }

}