import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/notificationRes.dart';
class NotificationController extends GetxController{
  var data=<Data>[].obs;
  var loading=false.obs;
  getData( value)async{
    loading.value=true;
    var url ='http://japps.co.in/kalinga/nismwa_api/index.php/Member/getNotificationList';
    Map map = {
      'page':'1',
      'id':value,
    };
    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200 && jsonDecode(response.body)["status"] != 0) {
      loading.value=false;
      data.clear();
      var jsonString = response.body;
      NotificationRes  headers  = NotificationRes.fromJson(json.decode(jsonString));
      data.addAll(headers.data);

    } else {
      loading.value=false;
      data.clear();
      print(response.body);
      return null;
    }
  }


}