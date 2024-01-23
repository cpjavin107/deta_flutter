import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/helper/My_Toast.dart';
import 'package:http/http.dart' as http;
import 'package:deta/models/subscribtion/resData.dart';
import 'package:deta/models/subscribtion/res_membershipa_data.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/Api_urls.dart';

class SubscribsionController extends GetxController {
  var membershipsList = <Data>[].obs;
  var paymentList = <Payment>[].obs;
var loading=false.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController transactionController = TextEditingController();
  String base64Image = '';


  validation(membershipaId) async {
    var map = new Map<String, dynamic>();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('member_id') ?? '';
    if (nameController.text.isEmpty) {
      MyToast.toast("Please Enter Name");
    } else if (mobileController.text.isEmpty) {
      MyToast.toast("Please Enter Mobile number");
    } else if (mobileController.text.length < 10 ||
        mobileController.text.length > 10) {
      MyToast.toast(
          "Please Enter valid Mobile number${mobileController.text.length}");
    } else if (transactionController.text.isEmpty) {
      MyToast.toast("Please Enter Transaction id");
    } else if (base64Image == '') {
      MyToast.toast("Please Upload Payment Slip");
    } else {
      final uri = 'https://na57.salesforce.com/services/oauth2/token';
      map['user_id'] = '$id';
      map['name'] = '${nameController.text}';
      map['phone'] = '${mobileController.text}';
      map['transaction_id'] = '${transactionController.text}';
      map['image'] = 'data:image/png;base64,${base64Image}';
      map['membership_id'] = '$membershipaId';
      print("****************************************");
      print("${map}");
      print("****************************************");
      http.Response response = await http.post(
        Uri.parse(
            'https://japps.co.in/deta/nismwa_api/index.php/Member/addPayment'),
        body: map,
      );
      print("****************************************");
      print("${response.body}");
      print("****************************************");
      var o = json.decode(response.body);
      ResData resData = ResData.fromJson(o);

      if (resData.status == 1) {
        getMembersData();
        Get.back();
        MyToast.toast("Your membership plan is active");
      } else {
        MyToast.toast("Try again after someTime");
      }
    }
  }

  getMembersData() async {
    loading.value=true;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('member_id') ?? '';
    var map = new Map<String, dynamic>();
    map['user_id'] = '$id';
    print("****************************************");
    print("${map}");
    print("****************************************");
    http.Response response = await http.post(
      Uri.parse('https://japps.co.in/deta/nismwa_api/index.php/Member/getMemberships'),
      body: map,
    );
    print("****************************************");
    print("${response.body}");
    print("****************************************");
    var o = json.decode(response.body);
    ResMembershipaData resData = ResMembershipaData.fromJson(o);
    membershipsList.clear();
    if (resData.status == 1) {
      loading.value=false;
      membershipsList.addAll(resData.data);
    } else {
      loading.value=false;
      membershipsList.clear();
    }
  }


}
