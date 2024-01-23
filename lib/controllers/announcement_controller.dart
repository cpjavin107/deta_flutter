import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deta/models/resAnnouncement.dart';
class AnnouncementController extends GetxController{
var data=<Data>[].obs;
var loading=false.obs;
getData()async{
  loading.value=true;
  var url ='http://japps.co.in/deta/nismwa_api/index.php/Member/getAllAnnouncement';
  var map = new Map<String, dynamic>();
  map['page'] = '1';
  var response = await http.post(Uri.parse(url),
      body: map
  );
  if (response.statusCode == 200) {
    loading.value=false;
    data.clear();
    var jsonString = response.body;
    ResAnnouncement  headers  = ResAnnouncement.fromJson(json.decode(jsonString));
    data.addAll(headers.data);

  } else {
    loading.value=false;
    data.clear();
    print(response.body);
    return null;
  }
}

}