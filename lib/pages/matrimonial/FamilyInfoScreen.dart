import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/matromonial_controller/matrimonial_signup_controller.dart';
import '../../res/colors/appcolors.dart';

class FamilyInfoScreen extends StatefulWidget {
  const FamilyInfoScreen({super.key});

  @override
  State<FamilyInfoScreen> createState() => _FamilyInfoScreenState();
}

class _FamilyInfoScreenState extends State<FamilyInfoScreen> {
  MSController msController=Get.put(MSController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Father's Name",
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
            controller: msController.fatherController,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Father Name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Mother's Name",
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
            controller: msController.motherController,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Mother Name',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Number of brother's",
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
            controller: msController.brotherController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Number of brother',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                "Number of Sister's",
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
            controller: msController.sisterController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Number of Sister',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    msController.savaFamilyData();
                  },
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

                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: const Text(
                      'NEXT',
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
