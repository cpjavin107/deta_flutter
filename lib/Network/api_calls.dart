import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deta/helper/My_Toast.dart';
import '../models/res_unauthorized.dart';
import 'Api_urls.dart';

class ApiCall {
  static Future postApiCall(String url, model,
      [String? yes]) async {
    String? showToast = yes;
    ///print(json.encode(model.toJson()));
    try {
      final response = await http.post(
        Uri.parse('${ApiUrl.baseUrl}$url'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          // 'Authorization': basicAuth,
        },
        body: json.encode(model.toJson()),
      );
      debugPrint("${json.encode(model.toJson())} hello.");
      if (response.statusCode == 200||response.statusCode == 201) {
        var o = json.decode(response.body);
        return o;
      } else {
        if (response.statusCode == 401) {
          var o = json.decode(response.body);
          ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
          MyToast.toast(resUnauthorized.message);
        } else {
          Get.back();
          MyToast.toast(response.reasonPhrase.toString());
          debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
        }
      }
    } catch (e) {
      showToast == "yes"
          ? debugPrint("something went wrong.")
          : MyToast.toast("something went wrong.");
      debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$url\n$e\n\n\n");
    }
  }

  static Future postApiCallToken(String url,basicAuth1 ,model,
      [String? yes]) async {
    String? showToast = yes;
    String basicAuth = 'Bearer $basicAuth1';
    ///print(json.encode(model.toJson()));
    try {
      final response = await http.post(
        Uri.parse('${ApiUrl.baseUrl}$url'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Authorization': basicAuth,
        },
        body: json.encode(model.toJson()),
      );
      debugPrint(json.encode(model.toJson()));
      if (response.statusCode == 200 ||response.statusCode == 201) {
        var o = json.decode(response.body);
        return o;
      } else {
        if (response.statusCode == 401) {
          var o = json.decode(response.body);
          ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
          MyToast.toast(resUnauthorized.message);
        } else {
          Get.back();
          MyToast.toast(response.reasonPhrase.toString());
          debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
        }
      }
    } catch (e) {
      showToast == "yes"
          ? debugPrint("something went wrong.")
          : MyToast.toast("something went wrong.");
      debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$url\n$e\n\n\n");
    }
  }
  static Future getApiCall(String url,
      [String? yes]) async
  {
    String? showToast = yes;

    try {
      final response = await http.get(
        Uri.parse('${ApiUrl.baseUrl}$url'),
        headers: {
          'Content-type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json',

        },
      );
      if  (response.statusCode == 200||response.statusCode == 201) {
        var o = json.decode(response.body.toString());
        return o;
      } else {
        if (response.statusCode == 401) {
          var o = json.decode(response.body);
          ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
          MyToast.toast(resUnauthorized.message);
        } else {
          Get.back();
          MyToast.toast(response.reasonPhrase.toString());
          debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
        }
      }
    } catch (e) {
      showToast == "yes"
          ? debugPrint("something went wrong.")
          : MyToast.toast("something went wrong.");
      debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$url\n$e\n\n\n");
    }
  }
  static Future getApiCall2(String url,basicAuth1,
      [String? yes]) async {
    String? showToast = yes;
    String basicAuth = 'Bearer $basicAuth1';
    try {
      final response = await http.post(
        Uri.parse('${ApiUrl.baseUrl}$url'),
        headers: {
          'Content-type': 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'Accept': 'application/json',
          'Authorization': basicAuth,
        },
      );
      print('Token : ${basicAuth1}');
      if (response.statusCode == 200) {
        var o = json.decode(response.body.toString());
        return o;
      } else {
        if (response.statusCode == 401) {
          var o = json.decode(response.body);
          ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
          MyToast.toast(resUnauthorized.message);
        } else {
          Get.back();
          MyToast.toast(response.reasonPhrase.toString());
          debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
        }
      }
    } catch (e) {
      showToast == "yes"
          ? debugPrint("something went wrong.")
          : MyToast.toast("something went wrong.");
      debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$url\n$e\n\n\n");
    }
  }

   static Future filterCallApi(endpoint)async {
     try {
       final response = await http.get(
         Uri.parse('${ApiUrl.baseUrl}$endpoint'),
         headers: {
           'Content-type': 'application/json',
           'X-Requested-With': 'XMLHttpRequest',
           'Accept': 'application/json',

         },
       );
       if  (response.statusCode == 200||response.statusCode == 201) {
         var o = json.decode(response.body.toString());
         return o;
       } else {
         if (response.statusCode == 401) {
           var o = json.decode(response.body);
           ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
           MyToast.toast(resUnauthorized.message);
         } else {
           // Get.back();
           MyToast.toast(response.reasonPhrase.toString());
           debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
         }
       }
     } catch (e) {
       MyToast.toast("something went wrong.");
       debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}$endpoint\n$e\n\n\n");
     }
   }
   static Future filterCallApiWithToken(endpoint,basicAuth1)async {
     String basicAuth = 'Bearer $basicAuth1';
     try {
       final response = await http.get(
         Uri.parse('${ApiUrl.baseUrl}$endpoint'),
         headers: {
           'Content-type': 'application/json',
           'X-Requested-With': 'XMLHttpRequest',
           'Accept': 'application/json',
           'Authorization': basicAuth,
         },
       );
       if  (response.statusCode == 200||response.statusCode == 201) {
         var o = json.decode(response.body.toString());
         return o;
       } else {
         if (response.statusCode == 401) {
           var o = json.decode(response.body);
           ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
           MyToast.toast(resUnauthorized.message);
         } else {
           // Get.back();
           MyToast.toast(response.reasonPhrase.toString());
           debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
         }
       }
     } catch (e) {
       MyToast.toast("something went wrong.");
       debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$endpoint\n$e\n\n\n");
     }
   }
   static Future filterCallApiWithTokenP(endpoint,basicAuth1,model)async {
     String basicAuth = 'Bearer $basicAuth1';
     try {
       final response = await http.patch(
         Uri.parse('${ApiUrl.baseUrl}$endpoint'),
         headers: {
           'Content-type': 'application/json',
           'X-Requested-With': 'XMLHttpRequest',
           'Accept': 'application/json',
           'Authorization': basicAuth,
         },

         body: json.encode(model.toJson()),
       );
       debugPrint("${json.encode(model.toJson())} hello.");
       if  (response.statusCode == 200||response.statusCode == 201) {
         var o = json.decode(response.body.toString());
         return o;
       } else {
         if (response.statusCode == 401) {
           var o = json.decode(response.body);
           ResUnauthorized resUnauthorized=ResUnauthorized.fromJson(o);
           MyToast.toast(resUnauthorized.message);
         } else {
           // Get.back();
           MyToast.toast(response.reasonPhrase.toString());
           debugPrint("\n\n\n\n${response.statusCode.toString()}\n\n\n\n\n");
         }
       }
     } catch (e) {
       MyToast.toast("something went wrong.");
       debugPrint("\n\n\n From catch block \n${ApiUrl.baseUrl}/$endpoint\n$e\n\n\n");
     }
   }
}
