import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/pages/matrimonial/MatrimonialHomeScreen.dart';

import '../../controllers/matromonial_controller/master_controller.dart';
import '../../res/colors/appcolors.dart';

class EducationInfoScreen extends StatefulWidget {
  const EducationInfoScreen({super.key});
  @override
  State<EducationInfoScreen> createState() => _EducationInfoScreenState();
}
class _EducationInfoScreenState extends State<EducationInfoScreen> {
  String statusValue="Select status";
  MasterController masterController=Get.put(MasterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Degree",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
      Obx(()=> DropdownButtonFormField(
        padding: EdgeInsets.all(0),
        decoration: const InputDecoration(
          isDense: true,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
          filled: true,
          fillColor: Colors.white,),
        dropdownColor: Colors.white,
        value: masterController.educationValue,
        onChanged: (String? newValue) {
          setState(() {
            masterController.educationValue = newValue!;
          });
        },
        items: masterController.educationList.value.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 16.0),),
          );
        }).toList(),
      )),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Institution",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Institution',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Start",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Start year',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "End",
                style: TextStyle(color: Colors.black, fontSize: 16.0),
              ),
              const Text(
                "*",
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your End year',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Status",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownButtonFormField(
            padding: EdgeInsets.all(0),
            decoration: const InputDecoration(
              isDense: true,
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
              filled: true,
              fillColor: Colors.white,),
            dropdownColor: Colors.white,
            value: statusValue,
            onChanged: (String? newValue) {
              setState(() {
                statusValue = newValue!;
              });
            },
            items: <String>['Select status','running','completed'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 16.0),),
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Get.to(MatrimonialHomeScreen());
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: const Text(
                      'Create account',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    ));
  }
}
