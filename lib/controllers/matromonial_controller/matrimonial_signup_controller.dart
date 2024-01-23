import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deta/helper/My_Toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MSController extends GetxController{
TextEditingController fatherController=TextEditingController();
TextEditingController motherController=TextEditingController();
TextEditingController sisterController=TextEditingController();
TextEditingController brotherController=TextEditingController();

 savaFamilyData() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
  var  member_id = await prefs.getString('member_id') ?? '';
   if(fatherController.text.isEmpty){
     MyToast.toast("Enter father name");
   }else if(motherController.text.isEmpty){
     MyToast.toast("Enter mother name");
   }else if(sisterController.text.isEmpty){
     MyToast.toast("Enter number of sister's");
   }else if(brotherController.text.isEmpty){
     MyToast.toast("Enter number of brother's");
   }else{
     var url ='http://japps.co.in/deta/nismwa_api/index.php/Member/addFamily';
     var map = new Map<String, dynamic>();
     map['cast'] = "   ${brotherController.text}";
     map['on_behalf'] = "   ${brotherController.text}";
     map['member_id'] = "   ${brotherController.text}";
     map['gotra'] = "   ${brotherController.text}";
     map['gender'] = "   ${brotherController.text}";
     map['date_of_birth'] = "   ${brotherController.text}";
     map['phone'] = "   ${brotherController.text}";
     map['email'] = "   ${brotherController.text}";
     map['complextion'] = "   ${brotherController.text}";
     map['disability'] = "   ${brotherController.text}";
     map['height'] = "   ${brotherController.text}";
     map['weight'] = "   ${brotherController.text}";
     map['blood_group'] = "   ${brotherController.text}";
     map['nationality'] = "   ${brotherController.text}";
     map['country'] = "   ${brotherController.text}";
     map['state'] = "   ${brotherController.text}";
     map['city'] = "   ${brotherController.text}";
     map['degree'] = "   ${brotherController.text}";
     map['start'] = "   ${brotherController.text}";
     map['end'] = "   ${brotherController.text}";
     map['status'] = "   ${brotherController.text}";
     map['manglik'] = "${sisterController.text}";
     map['astro_date_of_birth'] = "$member_id";
     map['time_of_birth'] = "${motherController.text}";
     map['city_of_birth'] = "${fatherController.text}";
     print("**********************");
     print("***********$map***********");
     print("**********************");

     var response = await http.post(Uri.parse(url),
         body: map
     );
     if (response.statusCode == 200) {
       var jsonString = response.body;
       print("**********************");
       print("***********$jsonString***********");
       print("**********************");
     } else {
       print(response.body);
     }
   }
 }

}