import 'package:deta/pages/bg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/management_controller.dart';
import '../../res/colors/appcolors.dart';
import 'office_bearers_meneber_screen.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Members'),
          elevation: 0.0,
          backgroundColor: AppColors.maroonColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              BgImage(),
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors.maroonColor,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[600],
                  labelStyle: const TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 13,

                  ),
                  tabs: [
                    Tab(
                        child: Text(
                          'Office Bearers'.toUpperCase(),
                        )),
                    Tab(
                        child: Text(
                          'Members'.toUpperCase(),
                        )),
                  ],
                ),
              ),
              Positioned(
                top: 50.0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      OfficeBearersScreen(page: "1",),
                      OfficeBearersScreen(page: "2",),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
