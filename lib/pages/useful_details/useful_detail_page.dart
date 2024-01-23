
import 'package:deta/widgets/bg_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' ;

import '../../controllers/contact_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/contact_model.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors

class Useful_Detail_Page extends StatefulWidget{
  String? value;
  Useful_Detail_Page({Key? key,  this.value}) : super(key : key );
  @override
  State<Useful_Detail_Page> createState() => _Useful_Detail_PageState(value!);
  }

ContactController? linksController;
late ContactModel linksData;

Future<dynamic> getlinks(String value) async {
  linksController = Get.put(ContactController());
  return linksController?.fetchProducts(value);
}


class _Useful_Detail_PageState extends State<Useful_Detail_Page> {
     String value;
    _Useful_Detail_PageState(this.value);

    @override
    void initState() {
      super.initState();

    }


  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
      future:Future.wait([getlinks(value)]),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasData){
          linksData = snapshot.data[0];
          return Scaffold(
            appBar: AppBar(
              title: Text("Details"),
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
                    child: linksData.status != 0 ? ListView.builder(
                      itemCount: linksData.data?.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: InkWell(
                            onTap: () {
                              launch('tel:${linksData.data?[index].contactNumber}');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child:   Container(
                                      color: AppColors.maroonColor,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(linksData.data?[index].address??"", style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 6,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(linksData.data?[index].contactNumber??"", style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ): Container(
                      color: Colors.white,
                      child: Center(child: Text(" Details not found!")),
                    ),
                  ),
                )
              ],

            ),
            //   bottomNavigationBar: Padding(
            // padding: EdgeInsets.all(10.0),
            //   child:
            //   InkWell(
            //       onTap: (){
            //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :'${ads[0]["big_image"]}',) ));
            //         },
            //       child: Image.network('${ads[0]["small_image"]}',)),
            //   ),

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