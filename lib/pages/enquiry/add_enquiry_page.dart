import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';

import '../../controllers/addenquiry_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/addenquiry_model.dart';
import 'enquiry.dart';

class Add_Enquiry extends StatefulWidget{
  @override
  State<Add_Enquiry> createState() => _Add_EnquiryState();
}

class _Add_EnquiryState extends State<Add_Enquiry> {
  FocusNode myFocusNode = FocusNode();
  bool changeButton = false;
   String _dropDownValue="Buy";
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Add Enquiry"),
       elevation: 0.0,
       backgroundColor: AppColors.maroonColor,
       iconTheme: IconThemeData(color: Colors.white),
     ),
     //drawer: MyDrawer(),
     body: Stack(
       fit: StackFit.expand,
       children:<Widget> [
         SingleChildScrollView(
             child: Form(
               key: _formkey,
               child: Column(
                 children: [
                   Card(
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
                     child: Padding(padding: const EdgeInsets.all(8.0),
                         child: Column(
                           children: [
                             /*Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: TextFormField(
                                 controller: _titleController,
                                 style: const TextStyle(color: Colors.black),
                                 keyboardType: TextInputType.text,
                                 decoration: const InputDecoration(
                                   hintText: "Enter Title",
                                   labelText: "Title*",
                                   hintStyle: TextStyle(fontSize: 14.0, color: Colors.orange),
                                   focusedBorder: OutlineInputBorder(
                                       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                       borderSide: BorderSide(color: Colors.black)),
                                 ),
                                 validator: (value) {
                                   if (value!.isEmpty) {
                                     return "Title cannot be empty";
                                   }
                                   return null;
                                 },

                               ),
                             ),
                             SizedBox(height: 20,),*/
                             TextFormField(
                               controller: _nameController,
                               style: const TextStyle(color: Colors.black),
                               keyboardType: TextInputType.text,

                               decoration: const InputDecoration(
                                 hintText: "Enter Name",
                                 labelText: "Name*",
                                 hintStyle: TextStyle(fontSize: 14.0, color: Colors.orange),

                                 focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                     borderSide: BorderSide(color: Colors.black)),
                               ),
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return "Name cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             SizedBox(height: 20,),

                             TextFormField(
                               controller: _phoneController,
                               maxLength: 10,
                               style: const TextStyle(color: Colors.black),
                               keyboardType: TextInputType.number,

                               decoration: const InputDecoration(
                                 hintText: "Enter Contact No.",
                                 labelText: "Contact No.*",
                                 hintStyle: TextStyle(fontSize: 14.0, color: Colors.orange),

                                 focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                     borderSide: BorderSide(color: Colors.black)),
                               ),
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return "Contact Number cannot be empty";
                                 } else if (value!.length < 10) {
                                   return "Contact Number length should be atleast 10 digit";
                                 }
                                 return null;
                               },
                             ),
                             SizedBox(height: 20,),

                             TextFormField(
                               controller: _descController,
                               maxLines: 3,
                               maxLength: 500,
                               style: const TextStyle(color: Colors.black),
                               keyboardType: TextInputType.text,
                               decoration: const InputDecoration(
                                 hintText: "Description",
                                 labelText: "Description*",
                                 hintStyle: TextStyle(fontSize: 14.0, color: Colors.orange),
                                 focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                     borderSide: BorderSide(color: Colors.black)),
                               ),
                               validator: (value) {
                                 if (value!.isEmpty) {
                                   return "Description cannot be empty";
                                 }
                                 return null;
                               },
                             ),
                             SizedBox(height: 20,),

                             // Card(
                             //   elevation: 5.0,
                             //   child: Padding(
                             //     padding: const EdgeInsets.all(8.0),
                             //     child: DropdownButton<String>(
                             //       hint: Text('Please choose a Enquiry Type'), // Not necessary for Option 1
                             //       isExpanded: true,
                             //       iconSize: 30.0,
                             //       items: <String>['Buy', 'Sell', 'Others'].map((String value) {
                             //         return DropdownMenuItem<String>(
                             //           value: value,
                             //           child: Text(value),
                             //         );
                             //       }).toList(),
                             //       onChanged: (value) {
                             //         setState(() {
                             //           _dropDownValue = value;
                             //          //print(_dropDownValue);
                             //         });
                             //
                             //       },
                             //     ),
                             //   ),
                             // ),
                             SizedBox(height: 40),

                             Padding(
                               padding:  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                               child: Column(
                                 children: [
                                   Material(
                                     color: AppColors.maroonColor,
                                     borderRadius:
                                     BorderRadius.circular(changeButton ? 50 : 8),

                                     child: InkWell(
                                       onTap:(){
                                         if(_formkey.currentState!.validate())
                                         {
                                           RegistrationUser();
                                          // print("Successful");
                                           if (Navigator.canPop(context)) {
                                             Navigator.pop(context);
                                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Enquiry() ));
                                             setState(() {});
                                           } else {
                                             SystemNavigator.pop();
                                           }
                                         }else
                                         {
                                          // print("Unsuccessfull");
                                         }
                                         },
                                       child: AnimatedContainer(
                                         duration: Duration(seconds: 1),
                                         width: changeButton ? 50 : 150,
                                         height: 40,
                                         alignment: Alignment.center,
                                         child: changeButton
                                             ? const Icon(
                                           Icons.done,
                                           color: Colors.white,
                                         ) : const Text(
                                           "SUBMIT",
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 14

                                           ),

                                         ),


                                       ),
                                     ),
                                   )

                                 ],
                               ),
                             ),

                           ],
                         ),
                       ),
                     ),

                 ],
               ),
             ),
           ),

       ],
     ),

   );
  }
  Future RegistrationUser()  async{
    AddEnquiryController enquiryController ;
    enquiryController = Get.put(AddEnquiryController());
    return enquiryController.fetchProducts(" ",_nameController.text,_phoneController.text,_descController.text);

  }
}

