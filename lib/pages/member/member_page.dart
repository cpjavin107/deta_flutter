import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deta/models/res_filter_data.dart';
import '../../controllers/member_filter_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../widgets/bg_image.dart';
import 'members.dart';
// ignore_for_file: prefer_const_constructors

class Member_Page extends StatefulWidget{
  @override
  State<Member_Page> createState() => _Member_PageState();
}

class _Member_PageState extends State<Member_Page> {
  MemberFilterController memberFilterController =
  Get.put(MemberFilterController());

  showMyDialog(var check) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return BottomDialog(
          check: check,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter Members'),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          BgImage(),
          Container(
            padding: EdgeInsets.all(10.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Search By Name",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    showMyDialog("0");
                  },
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: memberFilterController.nameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabled: false,
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'ex. Dinesh Aggarwal',
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change the color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change the color here
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Search By Firm Name",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    showMyDialog("1");
                  },
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: memberFilterController.nameFirmController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      enabled: false,
                      isDense: true,
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'ex. ABC Pvt Ltd',
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change the color here
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey), // Change the color here
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            10.0), // Set the border radius
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Search By Address",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: memberFilterController.addressController,
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'ex. a1-401',
                    focusColor: Colors.black,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Change the color here
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey), // Change the color here
                    ),
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(10.0), // Set the border radius
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(Members_List());

                    },
                    child: Text("Apply"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class BottomDialog extends StatefulWidget {
  var check;

  BottomDialog({super.key, required this.check});

  @override
  _BottomDialogState createState() => _BottomDialogState();
}

class _BottomDialogState extends State<BottomDialog> {
  TextEditingController searchController = TextEditingController();
  MemberFilterController memberFilterController =
  Get.put(MemberFilterController());

  @override
  void initState() {
    super.initState();
    memberFilterController.getFilterData("", "");

  }

  void filterItems(String query) {
    setState(() {
      if (widget.check == "0") {
        memberFilterController.getFilterData("$query", "");
      } else {
        memberFilterController.getFilterData("", "$query");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            onChanged: filterItems,
            decoration: InputDecoration(
              labelText: 'Search',
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.blue), // Change the color here
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: Colors.grey), // Change the color here
              ),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: memberFilterController.data.length,
                itemBuilder: (context, index) {
                  return CustomDailyPage(
                    data: memberFilterController.data[index],
                    check: widget.check,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDailyPage extends StatefulWidget {
  Data data;
  var check;

  CustomDailyPage({super.key, required this.data, required this.check});

  @override
  State<CustomDailyPage> createState() => _CustomDailyPageState();
}

class _CustomDailyPageState extends State<CustomDailyPage> {
  MemberFilterController memberFilterController =
  Get.put(MemberFilterController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.check == "0") {

          memberFilterController.nameController.text = widget.data!.name;
          memberFilterController.nameFirmController.clear();
          Get.back();
        } else {
          memberFilterController.nameController.clear();
          memberFilterController.nameFirmController.text =
          (widget.data?.firmName == ""
              ? "FIRE NAME NOT FOUND"
              : widget.data?.firmName)!;
          Get.back();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          // Container background color
          borderRadius:
          BorderRadius.circular(16.0), // Border radius for rounded corners
        ),
        margin: const EdgeInsets.only(top: 10.0, left: 8.0, right: 8.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                _buildRoundedImage('${widget.data?.imageUrl}'),
                SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.data?.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            '${widget.data?.firmName == "" ? "FIRE NAME NOT FOUND" : widget.data?.firmName}',
                            style:
                            TextStyle(color: Colors.black87, fontSize: 12.0)),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${widget.data?.designation}',
                            style:
                            TextStyle(color: Colors.black87, fontSize: 12.0)),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      // Border radius for individual images
      child: Image.network(
        imageUrl,
        width: 80.0,
        height: 80.0,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Image.asset(
            'assets/images/profile_icon.png',
            width: 60,
            height: 60,
          );
        },
      ),
    );
  }
}