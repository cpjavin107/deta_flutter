import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/controllers/matromonial_controller/master_controller.dart';
import '../../res/colors/appcolors.dart';

class PhysicalDetailsScreen extends StatefulWidget {
  const PhysicalDetailsScreen({super.key});
  @override
  State<PhysicalDetailsScreen> createState() => _PhysicalDetailsScreenState();
}

class _PhysicalDetailsScreenState extends State<PhysicalDetailsScreen> {
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
                "Complexion",
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
              hintText: 'Enter Your Complexion',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "Disability",
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
              hintText: 'Enter Your Disability',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "height",
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
              hintText: 'Enter Your height',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "Weight",
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
              hintText: 'Enter Your Weight',
            ),
          ),
          SizedBox(height: 10,),
         /* Row(
            children: [
              const Text(
                "Hair Colour",
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
              hintText: 'Enter Your Hair Colour',
            ),
          ),
          SizedBox(height: 10,),*/
          Row(
            children: [
              const Text("Blood Group",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          Obx(
            ()=> DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSearchBox: true,
              ),
              items: masterController.bloodGroupList.value,
              onChanged: (value) {
                setState(() {
                  masterController.bloodGroupValue = value!;
                });
              },
              selectedItem: masterController.bloodGroupValue,
            ),
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
