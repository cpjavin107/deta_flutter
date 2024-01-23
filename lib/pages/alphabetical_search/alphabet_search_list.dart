
import 'package:deta/models/alphasearchmember_model.dart' as aa;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/adstwo_controller.dart';
import '../../controllers/alphamember_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../widgets/big_image.dart';
import 'list_user_details.dart';
// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:deta/models/adssecond.dart';

class Alphabet_Search_Page extends StatefulWidget{
  String? value;
  Alphabet_Search_Page({Key? key,  this.value}) : super(key : key );

  @override
  State<Alphabet_Search_Page> createState() => _Alphabet_Search_PageState(value!);
}

class _Alphabet_Search_PageState extends State<Alphabet_Search_Page> {
    String? value;
    aa.AlphaMemberModel? alphaData;
    AdsTwoController? adsController;
    AlphaMemberController? alphaController;
    List<Ads> adsData = [];
    _Alphabet_Search_PageState(this.value);
  String member_id="";
  @override
  void initState() {
    super.initState();
  }

  Future<dynamic> getAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    member_id = prefs.getString('member_id') ?? '';
    adsController = Get.put(AdsTwoController());
    return adsController?.fetchProducts(member_id);
  }

  Future<dynamic> getMember() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    member_id = prefs.getString('member_id') ?? '';
    alphaController = Get.put(AlphaMemberController());
    return alphaController?.fetchProducts(member_id,value!);
  }
   _getRequests()async{
     setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
       future:Future.wait([getAds(),getMember()]),
       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
         if(snapshot.hasData){
           adsData = snapshot.data[0];
           alphaData = snapshot.data[1];
           return Scaffold(
             appBar: AppBar(
               title: Text("Search Result"),
               elevation: 0.0,
               backgroundColor: AppColors.maroonColor,
               iconTheme: IconThemeData(color: Colors.white),
             ),
             body: Stack(
               fit: StackFit.expand,
               children:<Widget> [
                 Expanded(
                   child:  alphaData?.status != 0 && alphaData != null ?ListView.builder(
                       itemCount:alphaData?.data?.length,
                       itemBuilder: (BuildContext context,int index){
                         return Padding(
                           padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
                           child: Column(
                             children: [
                               Card(
                                 elevation: 1,
                                 child: InkWell(
                                   onTap: () {
                                     Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Alpha_detail_Page(value :alphaData!.data?[index].memberId??"",)),)
                                         .then((val)=>{_getRequests()});
                                     //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value :alphaData.data[index].id,) ));
                                   },
                                   child: ClipPath(
                                     child:  Container(
                                       height: 80,
                                       decoration: BoxDecoration(
                                           border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                         children: [
                                           Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Container(
                                                   decoration: BoxDecoration(
                                                       border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
                                                   child: Container(child: alphaData!.data?[index].imageUrl == "" ?
                                                   CircleAvatar(backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                                                       :
                                                   CircleAvatar(radius: 30.0,backgroundImage: NetworkImage(alphaData!.data?[index].imageUrl?? ""),),),),
                                               ),
                                               Expanded(
                                                 child: Column(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     Container(
                                                       padding: EdgeInsets.all(4),
                                                       child:  Text(
                                                         alphaData!.data?[index].name??'',
                                                         maxLines: 2,
                                                         overflow: TextOverflow.clip,
                                                         style:
                                                         TextStyle(fontSize: 14,
                                                             color: Colors.black,
                                                             fontFamily: 'Bolds', fontWeight: FontWeight.w800)
                                                         ,
                                                       ),

                                                     ),
                                                     Container(
                                                       padding: EdgeInsets.all(4),
                                                       child:  Text(
                                                         alphaData!.data?[index].designation??'',
                                                         maxLines: 2,
                                                         overflow: TextOverflow.clip,
                                                         style:
                                                         TextStyle(fontSize: 14,
                                                             color: Colors.black,
                                                             fontFamily: 'Bolds', fontWeight: FontWeight.w400)
                                                         ,
                                                       ),

                                                     ),
                                                   ],
                                                 ),
                                               )
                                             ],

                                           ),
                                         ],
                                       ),
                                     ),
                                     clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(4))),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         );
                       }
                       ):  Container(
                     color: Colors.white,
                     child: Center(child: Text("Search Result Not found!")),
                   ),
                 ),

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