import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/matromonial_controller/master_controller.dart';
import '../../res/colors/appcolors.dart';

class BasicDetailScreen extends StatefulWidget {
 TabController tabController;
   BasicDetailScreen({super.key,required this.tabController});

  @override
  State<BasicDetailScreen> createState() => _BasicDetailScreenState();
}

class _BasicDetailScreenState extends State<BasicDetailScreen> {
  void moveToNextTab() {
    if (widget.tabController.index < widget.tabController.length - 1) {
      widget.tabController.animateTo(widget.tabController.index + 1);
    }
  }
  MasterController masterController=Get.put(MasterController());
  // String typeValue = 'Self';
  String genderValue = 'Male';
  late DateTime? frompickedDate;
  TextEditingController fromdate=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              const Text("On behalf",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          Obx(()=> DropdownButtonFormField(
              padding: EdgeInsets.all(0),
              decoration: const InputDecoration(
                isDense: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black12, width: 2),),
                filled: true,
                fillColor: Colors.white,),
              dropdownColor: Colors.white,
              value: masterController.typeValue,
              onChanged: (String? newValue) {
                setState(() {
                  masterController.typeValue = newValue!;
                });
              },
              items: masterController.onBehalfList.value.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 16.0),),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Cast",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
           DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.castList,
            onChanged: (value) {
              setState(() {
                masterController.castValue = value!;
              });
            },
            selectedItem: masterController.castValue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Gotra",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.gotraList,
            onChanged: (value) {
              setState(() {
                masterController.gotraValue = value!;
              });
            },
            selectedItem: masterController.gotraValue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Profession",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          DropdownSearch<String>(
            popupProps: PopupProps.menu(
              showSearchBox: true,
            ),
            items: masterController.professionList,
            onChanged: (value) {
              setState(() {
                masterController.professionValue = value!;
              });
            },
            selectedItem: masterController.professionValue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Name",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Name',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Gender",style: TextStyle(color: Colors.black,fontSize: 16.0),),
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
            value: genderValue,
            onChanged: (String? newValue) {
              setState(() {
                genderValue = newValue!;
              });
            },
            items: <String>['Male','Female'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value, style: const TextStyle(fontSize: 16.0),),
              );
            }).toList(),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Date Of Birth",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          GestureDetector(
            onTap: ()async {
              frompickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2100));

              if (frompickedDate != null) {
                setState(() {
                  final now = new DateTime.now();
                  String formatter = DateFormat('yMd').format(now);
                  fromdate.text = DateFormat('dd-MM-yyyy').format(frompickedDate!);
                });
              } else {}
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12,width: 2),),
              child: TextField(
                enabled: false,
                controller: fromdate,
                decoration: const InputDecoration(
                    hintText: 'Date of birth',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_month_outlined)
                ),
                style: const TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Phone",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Phone',
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text("Email",style: TextStyle(color: Colors.black,fontSize: 16.0),),
              const Text("*",style: TextStyle(color: Colors.red,fontSize: 16.0),),
            ],
          ),
          const SizedBox(height: 8.0,),
          TextField(
            decoration: InputDecoration(
              isDense: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12, width: 2.0),
              ),
              hintText: 'Enter Your Email',
            ),
          ),
          const SizedBox(height: 20.0,),

          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: (){
                    moveToNextTab();
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: AppColors.maroonColor, // Background Color
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0,right: 10.0),
                    child:const Text(
                      'SAVE & NEXT',
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
