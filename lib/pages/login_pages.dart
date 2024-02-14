import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../res/colors/appcolors.dart';
import '../widgets/bg_image.dart';
import 'otp_page.dart';
// ignore_for_file: prefer_const_constructors


class LoginPage extends StatefulWidget  {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  FocusNode myFocusNode = FocusNode();
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
   String? mobile, password;
  bool isLoading=false;
  final TextEditingController _mobileController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();
  late  ScaffoldMessengerState scaffoldMessenger ;


  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        changeButton = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children:<Widget> [
         BgImage(),
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
                      "DELHI ELECTRICAL TRADERS ASSOCIATION [REGD.]",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
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
                            maxLength: 10,
                            controller: _mobileController,

                            style: TextStyle(color: Colors.white),
                            onSaved: (val) {
                              mobile = val;
                            },
                            keyboardType: TextInputType.number,
                            focusNode: myFocusNode,
                            onChanged: (value){
                              if(value.length==10){
                                FocusScope.of(context).unfocus();
                              }
                            },
                            decoration: InputDecoration(
                              counterText: '',
                              hintText: "Enter Mobile no.",
                              labelText: "Mobile Number",

                              hintStyle: TextStyle(fontSize: 14.0, color: Colors.white),
                             labelStyle: TextStyle(
                              color: myFocusNode.hasFocus ? Colors.white : Colors.white
                          ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.white)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(color: Colors.white))

                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Mobile Number cannot be empty";
                              } else if (value!.length < 10) {
                                return "Mobile Number length should be atleast 10 digit";
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 30.0,),
                          Container(
                            padding: EdgeInsets.only(top: 5.0,bottom: 5.0),
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.btn_bg_Color,
                                  onPrimary: Colors.white,
                                  shadowColor: AppColors.btn_bg_Color,
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
                                  if(_mobileController.text.isEmpty)
                                  {
                                    scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please Enter valid mobile no.")));
                                    return;
                                  }
                                  login(_mobileController.text,_passwordController.text);
                                  setState(() {
                                    isLoading=true;
                                  });

                                },
                                child:const Text("SUBMIT"
                                    ,style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,)
                                ) ),
                          ),
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

 void  login(String mob, String pass) async {
     Map data = {
       'mobile': mob,
       'password': pass,
       'deviceToken': '',
       'deviceId': ''
     };
     print(data.toString());
     final  response= await http.post(
       Uri.parse("http://japps.co.in/kalinga/nismwa_api/index.php/Member/memberLogin"),
       body: data,);
    // print(response);
     setState(() {
       isLoading=false;
     });
     if (response.statusCode == 200) {
       var resposne1 = jsonDecode(response.body);
       print(resposne1);
       print(resposne1['status']);
       if(resposne1['status']==0){
        // scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}")));
         scaffoldMessenger.showSnackBar(SnackBar(content:Text("Invalid Mobile Number")));
       }else{
         var user = resposne1['data'];
         savePref(user[0]["id"],user[0]["name_of_the_member"],user[0]["email_id"],user[0]["contact_number"],
             user[0]["firm_name"],user[0]["image"],user[0]["executive_patron_life_member"]);
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OTP_Page(value :user[0]["contact_number"],) ));
         // scaffoldMessenger.showSnackBar(SnackBar(content:Text("${resposne1['msg']}")));

       }
       //{status: 0, msg: Invalid Username/Password}

           } else {
       scaffoldMessenger.showSnackBar(SnackBar(content:Text("Please try again!")));
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
    preferences.commit();

  }
  
}