import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../res/colors/appcolors.dart';
import '../widgets/bg_image.dart';
import 'home/home_page.dart';
// ignore_for_file: prefer_const_constructors

class OTP_Page extends StatefulWidget{
  String? value;
  OTP_Page({Key? key,  this.value}) : super(key : key );

  @override
  State<OTP_Page> createState() => _OTP_PageState(value!);
}

class _OTP_PageState extends State<OTP_Page> {
  FocusNode myFocusNode = FocusNode();
  String? value;
  _OTP_PageState(this.value);
   late SharedPreferences prefs;

  final _formKey = GlobalKey<FormState>();
  String? otp,mobile;
  bool isLoading=false;
  final TextEditingController _otpController=TextEditingController();
  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  late ScaffoldMessengerState scaffoldMessenger ;

  @override
  void initState() {
    super.initState();
    fetch();
  }
  fetch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString('mobileNumber') ?? '';
  }
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
     title: Text("OTP"),
     elevation: 0.0,
     backgroundColor: AppColors.maroonColor,
     iconTheme: IconThemeData(color: Colors.white),
   ),
   body: Stack(
     fit: StackFit.expand,
     children:<Widget> [
      // BgImage(),
       Center(
         child: SingleChildScrollView(
           child: Form(
             key: _formKey,

             child: Column(
               children: [
                 SizedBox(
                   height: 100.0,
                 ),
                 Image.asset(
                   "assets/images/large_logo.png",
                   fit: BoxFit.cover,
                 ),
                 SizedBox(
                   height: 10.0,
                 ),
                 Text(
                   "Enter your OTP here!",
                   style: TextStyle(
                     fontSize: 15,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(
                   height: 20.0,
                 ),
                 Padding(
                   padding:
                   const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                   child: Column(
                     children: [
                       TextFormField(
                         controller: _otpController,
                         style: TextStyle(color: Colors.black),
                         onSaved: (val) {
                           otp = val;
                         },
                         onChanged: (val) {
                           if(val.length==6){
                             FocusScope.of(context).unfocus();
                             OTP(_otpController.text,);
                             setState(() {
                               isLoading=true;
                             });
                           }
                         },
                         keyboardType: TextInputType.number,
                         focusNode: myFocusNode,
                         decoration: InputDecoration(
                           hintText: "Enter OTP",
                           labelText: "OTP",

                           hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                           labelStyle: TextStyle(
                               color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                           ),
                           focusedBorder: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(5.0)),
                               borderSide: BorderSide(color: Colors.black)),

                         ),

                       ),
                       SizedBox(
                         height: 20,
                       ),
                       Padding(
                         padding:  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                         child: Column(
                           children: [
                             ListTile(
                               title: Row(
                                 children: <Widget>[
                                   // ElevatedButton(
                                   //     style: ElevatedButton.styleFrom(
                                   //       primary: Colors.lightBlue,
                                   //       onPrimary: Colors.white,
                                   //       shadowColor: Colors.lightBlue,
                                   //       elevation: 8,
                                   //       shape: RoundedRectangleBorder(
                                   //           borderRadius: BorderRadius.circular(10.0)),
                                   //       minimumSize: Size(100, 40), //////// HERE
                                   //     ),
                                   //     onPressed: ()  {
                                   //       if(isLoading)
                                   //       {
                                   //         return;
                                   //       }
                                   //       OTP(_otpController.text,);
                                   //       setState(() {
                                   //         isLoading=true;
                                   //       });
                                   //
                                   //     },
                                   //     child:SizedBox(child: const Text("Resend OTP"
                                   //         ,style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,)
                                   //     )) ),
                                   SizedBox(width: 10,),
                                   ElevatedButton(
                                       style: ElevatedButton.styleFrom(
                                         primary: AppColors.maroonColor,
                                         onPrimary: Colors.white,
                                         shadowColor: AppColors.maroonColor,
                                         elevation: 8,
                                         shape: RoundedRectangleBorder(
                                             borderRadius: BorderRadius.circular(10.0)),
                                         minimumSize: Size(100, 40), //////// HERE
                                       ),
                                       onPressed: ()  {
                                         if(isLoading)
                                         {
                                           return;
                                         }
                                         if(_otpController.text.isEmpty)
                                         {
                                           scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Enter valid mobile no.")));
                                           return;
                                         }
                                         OTP(_otpController.text,);
                                         setState(() {
                                           isLoading=true;
                                         });

                                       },
                                       child:SizedBox(child: const Text("Submit"
                                           ,style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,)
                                       )) ),




                                 ],
                               ),
                             ),

                           ],
                         ),
                       )
                     ],
                   ),
                 )
               ],
             ),
           ),
         ),
       )
     ],
   ),

 );
  }
  void  OTP(String otp) async {
    Map data = {
      'mobile': mobile,
      'password': otp,
      'deviceToken': '',
      'deviceId': ''
    };
    print(data.toString());
    final  response= await http.post(
      Uri.parse("http://japps.co.in/kalinga/nismwa_api/index.php/Member/memberLogin"),
      body: data,);
    print(response);
    setState(() {
      isLoading=false;
    });

    if (response.statusCode == 200) {
      var resposne1=jsonDecode(response.body);
      if(response.body.isNotEmpty){
        //scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}")));
      }
      if(otp == ""){
        scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}")));
      }else{
        if(resposne1['status']==0){
          // scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}")));
          scaffoldMessenger.showSnackBar(SnackBar(content:Text("Invalid OTP!",style: TextStyle(color:Colors.white),),backgroundColor: Colors.red,));
        }else{
          var user = resposne1['data'];
          savePref(user[0]["id"],user[0]["name_of_the_member"],user[0]["email_id"],user[0]["contact_number"],
              user[0]["firm_name"],user[0]["image"],user[0]["executive_patron_life_member"]);
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_Page()));
          scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}",style: TextStyle(color:Colors.white),),backgroundColor: Colors.green));
        }
      }
    } else {
      scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please try again!",style: TextStyle(color:Colors.white),),backgroundColor: Colors.red));
    }


  }
  savePref(String id, String name, String email, String mobileNumber,String firm_name,String image,String type_name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("member_id", id);
    preferences.setString("name", name);
    preferences.setString("email", email);
    preferences.setString("mobileNumber", mobileNumber);
    preferences.setString("firm", firm_name);
    preferences.setString("image", image);
    preferences.setString("type_name", type_name);
    preferences.setBool("status", true);
    preferences.commit();

  }

}