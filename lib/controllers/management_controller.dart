import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/res_management_data.dart';
class ManagementController extends GetxController{
 var officeBearersList=<Data>[].obs;
var loading=false.obs;
  getData(var page) async {
    loading.value=true;
    var url = 'https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllManagementMembersByPriority';
    var map = new Map<String, dynamic>();
    map['priority'] = "$page";
    map['ownerId'] = "";
    map['page'] = "1";
    print("**********************");
    print("***********$map***********");
    print("**********************");

    var response = await http.post(Uri.parse(url), body: map);
    if (response.statusCode == 200) {
      loading.value=false;
      var jsonString = response.body;
      print("**********************");
      print("***********$jsonString***********");
      print("**********************");
      ResManagementData resManagementData = ResManagementData.fromJson(json.decode(jsonString));
      officeBearersList.clear();
      officeBearersList.addAll(resManagementData.data);
    } else {
      loading.value=false;
      print(response.body);
    }
  }

}