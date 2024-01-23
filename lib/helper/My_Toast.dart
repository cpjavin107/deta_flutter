import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class MyToast{
  static void toast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.pink.shade900,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}