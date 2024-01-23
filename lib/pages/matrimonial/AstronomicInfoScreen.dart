import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../res/colors/appcolors.dart';

class AstronomicInfoScreen extends StatefulWidget {
  const AstronomicInfoScreen({super.key});

  @override
  State<AstronomicInfoScreen> createState() => _AstronomicInfoScreenState();
}

class _AstronomicInfoScreenState extends State<AstronomicInfoScreen> {
  late DateTime? pickedDate;
  String statusValue="Select";
  TextEditingController birthDT=TextEditingController();
  TimeOfDay birthTime = TimeOfDay.now();
  late DateTime? frompickedDate;
  TextEditingController fromdate=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Manglik",
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
            items: <String>['Select','Yes','No'].map<DropdownMenuItem<String>>((String value) {
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
              const Text(
                "Time of birth",
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
          GestureDetector(
            onTap: ()async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                initialTime: birthTime,
              );
              if (picked != null && picked != birthTime) {
                setState(() {
                  birthTime = picked;
                  birthDT.text="${birthTime.format(context)}" ;
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12,width: 2),),
              child: TextField(
                enabled: false,
                controller: birthDT,
                decoration: const InputDecoration(
                    hintText: 'Time of birth',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.watch_later_outlined)
                ),
                style: const TextStyle(color: Colors.black,fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              const Text(
                "City of birth",
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
              hintText: 'Enter Your City of birth',
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
    )
    );
  }
}
