import 'dart:convert';

import 'package:get/get.dart';
import 'package:deta/models/MasterModels/res_blood_group.dart';
import 'package:deta/models/MasterModels/res_cast.dart';
import 'package:deta/models/MasterModels/res_gotra.dart';
import 'package:deta/models/MasterModels/res_nationality.dart';
import 'package:deta/models/MasterModels/res_profession.dart';
import 'package:deta/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../Network/Api_urls.dart';
import '../../Network/api_calls.dart';
import '../../helper/My_Toast.dart';
import '../../models/MasterModels/req_city.dart';
import '../../models/MasterModels/req_state_data.dart';
import '../../models/MasterModels/res_city.dart';
import '../../models/MasterModels/res_country_data.dart';
import '../../models/MasterModels/res_education.dart';
import '../../models/MasterModels/res_onbehalf.dart' as obf;
import '../../models/MasterModels/res_state.dart';

class MasterController extends GetxController{
  var countryList=<Country>[].obs;
  var stateList=<String>[].obs;
  var cityList=<String>[].obs;
  var gotraList=<String>[].obs;
  var professionList=<String>[].obs;
  var nationalityList=<String>[].obs;
  var castList=<String>[].obs;
  var educationList=<String>[].obs;
  var onBehalfList=<String>[].obs;
  var bloodGroupList=<String>[].obs;
  String typeValue = 'select on behalf';
  String educationValue = 'select education';
  String stateValue = 'select state name';
  String cityValue = 'select city name';
  String gotraValue = 'select gotra';
  String castValue = 'select cast';
  String nationalityValue = 'select nationality';
  String professionValue = 'select profession';
  String bloodGroupValue = 'select blood Group';
  
  getEducationData()async{
    var res = await ApiCall.getApiCall(ApiUrl.educationData);
    if (res != null) {
      ResEducation resMasterData = ResEducation.fromJson(res);
      educationList.clear();
      educationList.add("select education");
      Constants.educationIDToNameHashmap.clear();
      Constants.educationNameToIDHashmap.clear();
      for (var i = 0; i < resMasterData.data!.length; i++) {
        educationList.add(resMasterData.data![i].name);
        Constants.educationNameToIDHashmap[resMasterData.data![i].name]= int.parse(resMasterData.data![i].id);
        Constants.educationIDToNameHashmap[int.parse(resMasterData.data![i].id)]= resMasterData.data![i].name;
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getNationalityData()async{
    var res = await ApiCall.getApiCall(ApiUrl.nationalityData);
    if (res != null) {
      ResNationalityData resMasterData = ResNationalityData.fromJson(res);
      nationalityList.clear();
      nationalityList.add("select nationality");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        nationalityList.add(resMasterData.data![i].nationality);
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getGotraData()async{
    var res = await ApiCall.getApiCall(ApiUrl.gotraData);
    if (res != null) {
      ResGotraData resMasterData = ResGotraData.fromJson(res);
      gotraList.clear();
      gotraList.add("select gotra");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        gotraList.add(resMasterData.data![i].title);
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getCastData()async{
    var res = await ApiCall.getApiCall(ApiUrl.castData);
    if (res != null) {
      ResCastData resMasterData = ResCastData.fromJson(res);
      castList.clear();
      castList.add("select cast");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        castList.add(resMasterData.data![i].title);
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getProfessionData()async{
    var res = await ApiCall.getApiCall(ApiUrl.professionData);
    if (res != null) {
      ResProfessionData resMasterData = ResProfessionData.fromJson(res);
      professionList.clear();
      professionList.add("select profession");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        professionList.add(resMasterData.data![i].title);
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getBloodGroupData()async{
    var res = await ApiCall.getApiCall(ApiUrl.bloodGroupData);
    print("**********");
    print("***** blood group data ${res} *****");
    print("**********");
    if (res != null) {
      ResBloodGroupData resMasterData = ResBloodGroupData.fromJson(res);
      bloodGroupList.clear();
      bloodGroupList.add("select blood group");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        bloodGroupList.add(resMasterData.data![i].title);
      }
    }else{

    }
  }
  getOnBehalfData()async{
    var res = await ApiCall.getApiCall(ApiUrl.onBehalfData);
    if (res != null) {
      obf.ResOnBehalf resMasterData = obf.ResOnBehalf.fromJson(res);
      onBehalfList.clear();
      Constants.onBehalfIDToNameHashmap.clear();
      Constants.onBehalfNameToIDHashmap.clear();
      onBehalfList.add("select on behalf");
      for (var i = 0; i < resMasterData.data!.length; i++) {
        onBehalfList.add(resMasterData.data![i].name);
        Constants.onBehalfNameToIDHashmap[resMasterData.data![i].name]= int.parse(resMasterData.data![i].id);
        Constants.onBehalfIDToNameHashmap[int.parse(resMasterData.data![i].id)]= resMasterData.data![i].name;
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getCountryData()async{
    var res = await ApiCall.getApiCall(ApiUrl.countryData);
    if (res != null) {
      ResCountryData resMasterData = ResCountryData.fromJson(res);
      countryList.clear();
      stateList.clear();
      cityList.clear();
      for (var i = 0; i < resMasterData.data!.length; i++) {
        countryList.add(resMasterData.data![i]);
      }
    }else{
      // MyToast.toast("Country data not found");
    }
  }
  getState() async {
    var url ='http://japps.co.in/deta/nismwa_api/index.php/Member/stateList';

    // from-data
    var map = new Map<String, dynamic>();
    map['countryId'] = "77";


    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("**********************");
      print("***********$jsonString***********");
      print("**********************");
      ResStateData resMasterData = ResStateData.fromJson(json.decode(jsonString));
      print(resMasterData.toJson());
      stateList.clear();
      cityList.clear();
      Constants.stateNameToIDHashmap.clear();
      Constants.stateIDToNameHashmap.clear();
      stateList.add("select state name");
      for (var i = 0; i < resMasterData.data.length; i++) {
        stateList.add(resMasterData.data[i].stateName);
        Constants.stateNameToIDHashmap[resMasterData.data![i].stateName]= int.parse(resMasterData.data![i].stateId);
        Constants.stateIDToNameHashmap[int.parse(resMasterData.data![i].stateId)]= resMasterData.data![i].stateName;
      }
    } else {
      print(response.body);

    }
  }
  getCityData(code)async{
    var url ='http://japps.co.in/deta/nismwa_api/index.php/Member/cityList';
    // from-data
    var map = new Map<String, dynamic>();
    map['stateId'] = "$code";


    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print("**********************");
      print("***********$jsonString***********");
      print("**********************");
      ResCityData resMasterData = ResCityData.fromJson(json.decode(jsonString));
      cityList.clear();
      Constants.cityNameToIDHashmap.clear();
      Constants.cityIDToNameHashmap.clear();
      cityList.add("select city name");
      for (var i = 0; i < resMasterData.data.length; i++) {
        cityList.add(resMasterData.data[i].cityName);
        Constants.cityNameToIDHashmap[resMasterData.data![i].cityName]= int.parse(resMasterData.data![i].cityId);
        Constants.cityIDToNameHashmap[int.parse(resMasterData.data![i].cityId)]= resMasterData.data![i].cityName;
      }
    }else{

    }
  }
}