import 'dart:convert';

import 'package:deta/models/res_filter_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MemberFilterController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController nameFirmController = TextEditingController();
  TextEditingController addressController = TextEditingController();
var data=<Data>[].obs;
var memberData=<Data>[].obs;

  getFilterData(var name,var firmName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var  member_id = await prefs.getString('member_id') ?? '';
      var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllFirmOwners';
      var map = new Map<String, dynamic>();
      map['deal'] = "";
      map['address'] = "";
      map['firmName'] = "$firmName";
      map['ownerName'] = "$name";
      map['block'] = "";
      map['page'] = "1";
      map['ownerId'] = "$member_id";
      print("**********************");
      print("***********$map***********");
      print("**********************");
      var response = await http.post(Uri.parse(url), body: map);
    Map<String, dynamic> data1 = jsonDecode(response.body);
      if (response.statusCode == 200 && data1['status'] == 1) {
        var jsonString = response.body;
        ResFilterData resFilterData = ResFilterData.fromJson(json.decode(jsonString));
        data.clear();
        data.addAll(resFilterData.data);
        print("**********************");
        print("***********$jsonString***********");
        print("**********************");
      } else {
        data.clear();
        print(response.body);
      }
    }
  getFilterMemberData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var  member_id = await prefs.getString('member_id') ?? '';
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllFirmOwners';
    var map = new Map<String, dynamic>();
    map['deal'] = "";
    map['address'] = "${addressController.text??""}";
    map['firmName'] = "${nameFirmController.text??""}";
    map['ownerName'] = "${nameController.text??""}";
    map['block'] = "";
    map['page'] = "1";
    map['ownerId'] = "$member_id";
    print("**********************");
    print("***********$map***********");
    print("**********************");
    var response = await http.post(Uri.parse(url), body: map);
    Map<String, dynamic> data1 = jsonDecode(response.body);
    if (response.statusCode == 200 && data1['status'] == 1) {
      var jsonString = response.body;
      ResFilterData resFilterData = ResFilterData.fromJson(json.decode(jsonString));
      memberData.clear();
      memberData.addAll(resFilterData.data);
      print("**********************");
      print("***********$jsonString***********");
      print("**********************");
    } else {
      memberData.clear();
      print(response.body);
    }
  }


}