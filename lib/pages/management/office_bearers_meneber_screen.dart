import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/management_controller.dart';
import '../../res/colors/appcolors.dart';
import '../alphabetical_search/list_user_details.dart';

class OfficeBearersScreen extends StatefulWidget {
  var page;
  OfficeBearersScreen({super.key,required this.page});

  @override
  State<OfficeBearersScreen> createState() => _OfficeBearersScreenState();
}

class _OfficeBearersScreenState extends State<OfficeBearersScreen> {
  ManagementController managementController=Get.put(ManagementController());
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
     await managementController.getData(widget.page);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Obx(
            ()=> managementController.loading.value?Center(child: CircularProgressIndicator()):GridView.count(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 2.0, // Spacing between columns
          mainAxisSpacing: 2.0, // Spacing between rows
          children: List.generate(
            managementController.officeBearersList.length,
                (index) {
              return GestureDetector(
                onTap: (){ Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Alpha_detail_Page(value :managementController.officeBearersList[index].memberId,)),)
                    .then((val)=>{});},
                  child: _Card("${managementController.officeBearersList[index].image}","${managementController.officeBearersList[index].mcName}","${managementController.officeBearersList[index].designationName}"));
            },
          ),
        ),
      ),
    );
  }
  Widget _Card(var img,var title,var type) {
    return Card(
      color: AppColors.mainColor,
      shadowColor: AppColors.maroonColor,
      elevation: 5.0, // Set the elevation for the shadow effect
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0), // Set the corner radius
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70.0),
                child: Image.network(
                  '$img', // Replace with your image URL
                  width: 140.0,
                  height: 140.0,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Image.asset('assets/images/profile_icon.png',width: 60,
                      height:60,);
                  },// You can adjust the BoxFit as needed
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.maroonColor,
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          '$title',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '$type',
                        style: TextStyle(
                          fontSize: 11.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
