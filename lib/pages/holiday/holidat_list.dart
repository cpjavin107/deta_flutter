
import 'package:deta/widgets/bg_image.dart';
import 'package:flutter/material.dart';
import '../../controllers/holiday_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/holiday_model.dart';
import '../../widgets/big_image.dart';
import 'package:get/get.dart';

// ignore_for_file: prefer_const_constructors

class HoliDay_Page extends StatefulWidget{
  @override
  State<HoliDay_Page> createState() => _HoliDay_PageState();
}
HolidayController? holidayController ;
late HolidayModel holidayData;

Future<dynamic> getHoliday() async {
  holidayController = Get.put(HolidayController());
  return   holidayController?.fetchProducts();
}
class _HoliDay_PageState extends State<HoliDay_Page> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getHoliday()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            holidayData =  snapshot.data[0];
            return Scaffold(
              appBar: AppBar(
                title: Text("Holiday Calender"),
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
                      child: holidayData.status != 0 ? ListView.builder(
                        itemCount: holidayData.data?.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child:  Container(
                                        color: AppColors.maroonColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(holidayData.data![index].datee!+" ("+holidayData.data![index].day!+")", style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(holidayData.data?[index].occasion??"", style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black,

                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ):Container(
                        color: Colors.white,
                        child: Center(child: Text(holidayData.msg??"", style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,

                        ))),
                      ) ,
                    ),
                  )
                ],

              ),
              bottomNavigationBar: Padding(
                padding: EdgeInsets.all(10.0),
                child:
                InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :holidayData.ads?[0].bigImage??"",) ));
                    },
                    child: Image.network(holidayData.ads?[0].smallImage??"",)),
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