
import 'package:deta/widgets/bg_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/adstwo_controller.dart';
import 'package:deta/models/adssecond.dart';
import '../../res/colors/appcolors.dart';
import '../../widgets/big_image.dart';
import 'alphabet_search_list.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors

class Alphabet_List extends StatefulWidget{
  @override
  State<Alphabet_List> createState() => _Alphabet_ListState();
}

class _Alphabet_ListState extends State<Alphabet_List> {
  List<String> myList = ['A', 'B', 'C','D', 'E', 'F','G', 'H', 'I','J', 'K', 'L','M',
                'N', 'O','P', 'Q', 'R','S', 'T', 'U','V', 'W', 'X','Y', 'Z'];
  var res, ads,mobile;
  String member_id="",name="",image="";

  @override
  void initState() {
    super.initState();
  }

  late AdsTwoController adsController ;
  List<Ads> adsData = [];

  Future<dynamic> getAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString('mobileNumber') ?? '';
    member_id = prefs.getString('member_id') ?? '';
    name = prefs.getString('name') ?? '';
    image = prefs.getString('image') ?? '';

    adsController = Get.put(AdsTwoController());
    return   adsController.fetchProducts(member_id);
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getAds()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            adsData = snapshot.data[0];
            return Scaffold(
              appBar: AppBar(
                title: Text("Filter"),
                elevation: 0.0,
                backgroundColor: AppColors.maroonColor,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Stack(
                fit: StackFit.expand,
                children:<Widget> [
                  BgImage(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  Center(
                      child:  GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:5),
                        itemCount: myList.length,
                        itemBuilder: (context, index) {
                          var data = myList[index];
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alphabet_Search_Page(value :data,) ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 15,),
                                    Text(data, style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    SizedBox(height: 10,),

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],

              ),
              bottomNavigationBar: Padding(
              padding: EdgeInsets.all(10.0),
              child:
              InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :adsData[0].bigImage??"",) ));
                  },
                  child: Image.network(adsData[0].smallImage??"",)),
            ),

            );
          }else{
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }
        }
    );


  }
}