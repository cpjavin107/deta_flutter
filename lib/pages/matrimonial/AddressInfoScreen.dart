import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/controllers/matromonial_controller/master_controller.dart';
import 'package:deta/helper/My_Toast.dart';

import '../../res/colors/appcolors.dart';
import '../../utils/constants.dart';

class AddressInfoScreen extends StatefulWidget {
  const AddressInfoScreen({super.key});

  @override
  State<AddressInfoScreen> createState() => _AddressInfoScreenState();
}

class _AddressInfoScreenState extends State<AddressInfoScreen> {
  MasterController masterController=Get.put(MasterController());
  String stateValue = 'Select state';
  String cityValue = 'Select city';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Nationality",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.nationalityList,
            onChanged: (value) {
              setState(() {
                masterController.nationalityValue = value!;
              });
            },
            selectedItem: masterController.nationalityValue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "Address",
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
              hintText: 'Enter Your Address',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Country",style: TextStyle(color: Colors.black,fontSize: 16.0),),
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
            value: "India",
            onChanged: (String? newValue) {
              setState(() {
                // stateValue = newValue!;
              });
            },
            items: <String>['India',].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 16.0),),
              );
            }).toList(),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("State",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.stateList,
            onChanged: (value) {
              setState(() {
                masterController.stateValue = value!;
                if(masterController.stateValue=="select state name"){
                  MyToast.toast("please select state name");
                  masterController.cityValue="select city name";
                  masterController.cityList.clear();
                }else{
                  var code= Constants.stateNameToIDHashmap[masterController.stateValue];
                  masterController.cityValue="select city name";
                  masterController.getCityData(code);
                }
              });
            },
            selectedItem: masterController.stateValue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("City",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.cityList,
            onChanged: (value) {
              setState(() {
                masterController.cityValue = value!;
              });
            },
            selectedItem: masterController.cityValue,
          ),
          SizedBox(height: 30,),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 16.0,color: Colors.white),
                    ),
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:const Text(
                      'NEXT',
                      style: TextStyle(fontSize:16.0,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    ));
  }
}
