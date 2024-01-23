import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:deta/pages/matrimonial/AddressInfoScreen.dart';
import 'package:deta/pages/matrimonial/AstronomicInfoScreen.dart';
import 'package:deta/pages/matrimonial/BasicDetailScreen.dart';
import 'package:deta/pages/matrimonial/EducationInfoScreen.dart';
import 'package:deta/pages/matrimonial/FamilyInfoScreen.dart';
import 'package:deta/pages/matrimonial/ImagesScreen.dart';
import 'package:deta/pages/matrimonial/PhysicalDetailsScreen.dart';
import '../../controllers/matromonial_controller/master_controller.dart';
import '../../res/colors/appcolors.dart';
class CustomTabController extends TabController {
  bool disableTabChange = false;

  CustomTabController({@required length, @required vsync, initialIndex})
      : super(length: length, vsync: vsync, initialIndex: initialIndex);

  @override
  set index(int value) {
    if (!disableTabChange) {
      super.index = value;
    }
  }
}
class MatrimonialSignUpScreen extends StatefulWidget {
  const MatrimonialSignUpScreen({super.key});

  @override
  State<MatrimonialSignUpScreen> createState() => MatrimonialSignUpScreenState();
}

class MatrimonialSignUpScreenState extends State<MatrimonialSignUpScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  MasterController masterController=Get.put(MasterController());
  void handleTabTap(int tabIndex) {

    _tabController.animateTo(_tabController.index);
    print('Tab $tabIndex tapped!');
  }
  @override
  void initState() {
    masterController.getOnBehalfData();
    masterController.getEducationData();
    masterController.getGotraData();
    masterController.getProfessionData();
    masterController.getCastData();
    masterController.getState();
    masterController.getBloodGroupData();
    masterController.getNationalityData();
    _tabController= TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.maroonColor,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.only(left: 20.0,right: 20.0),
              color: AppColors.maroonColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  Align( alignment:Alignment.center,child: SizedBox(height:45,child: Image.asset("assets/images/mm.png",color: Colors.white,))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Create your account',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                  ),
                  Text('Fill out the form to get started',style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Positioned(
              top: 200.0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.9,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))
                  ),
                child: Stack(
                  children: [
                    TabBar(
                      onTap: handleTabTap,
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      isScrollable: true,
                      indicatorColor: Colors.redAccent,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[600],
                      labelStyle: const TextStyle(fontSize: 14, ),
                      unselectedLabelStyle: const TextStyle(fontSize: 13,),
                      tabs: [
                        Tab(child: Text('Basic Info'.toUpperCase(),)),
                        Tab(child: Text('Physical Info'.toUpperCase(),)),
                        Tab(child: Text('Astronomic Info'.toUpperCase(),)),
                        Tab(child: Text('Family Info'.toUpperCase(),)),
                        Tab(child: Text('Address Info'.toUpperCase(),)),
                        Tab(child: Text('Upload Pictures'.toUpperCase(),)),
                        Tab(child: Text('Education Info'.toUpperCase(),)),
                        // Tab(child: Text('Requests'.toUpperCase(),)),
                      ],
                    ),
                    Positioned(
                      top: 20.0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children:  [
                            BasicDetailScreen(tabController: _tabController,),
                            PhysicalDetailsScreen(),
                            AstronomicInfoScreen(),
                            FamilyInfoScreen(),
                            AddressInfoScreen(),
                            ImageGrid(),
                            EducationInfoScreen()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
