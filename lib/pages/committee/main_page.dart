import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controllers/ex_committee_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/committee_model.dart';
// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';

import '../alphabetical_search/list_user_details.dart';

class Main_page_Committee extends StatefulWidget{
  @override
  State<Main_page_Committee> createState() => _Main_page_CommitteeState();
}

late ExCommitteeController memberController ;

Future<dynamic> getMembers() async {
  memberController = Get.put(ExCommitteeController());
  return   memberController.fetchProducts();
}


class _Main_page_CommitteeState extends State<Main_page_Committee> with TickerProviderStateMixin {

  late Member2Data memberData;
  List<Data>  memberData2=[];
  String check ="1";

  final TextEditingController _typeAheadController = TextEditingController();

  _getRequests()async{
    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getMembers()]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            memberData = snapshot.data[0];
           // memberData2 = memberData.data ;

            return Scaffold(
                appBar: AppBar(
                  title: Text('Executive Committee'),
                  elevation: 0.0,
                  backgroundColor: AppColors.maroonColor,
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                body: Stack(
                  fit: StackFit.expand,
                  children:<Widget> [
                    Center(
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 45,
                                child: TextField(
                                  onChanged: (value) {
                                    List<Data> dummySearchList = [];
                                    dummySearchList.addAll(memberData.data as Iterable<Data>);
                                    if(value.isNotEmpty) {
                                      List<Data> dummyListData = [];
                                      dummySearchList.forEach((item) {
                                        if(item.name.contains(value)) {
                                          dummyListData.add(item);
                                        }
                                      });
                                      setState(() {
                                        memberData2.clear();
                                        memberData2.addAll(dummyListData);
                                        check ="2";
                                      });
                                      return;
                                    } else {
                                      setState(() {
                                        memberData2.clear();
                                        memberData2.addAll(memberData.data as Iterable<Data>);
                                        check ="2";
                                      });
                                    }
                                  },
                                  controller: _typeAheadController,
                                  decoration: InputDecoration(
                                      labelText: "Search",
                                      hintText: "Search",
                                      prefixIcon: Icon(Icons.search),
                                      labelStyle: TextStyle( fontSize: 12 , fontFamily: 'Normal',),
                                      hintStyle: TextStyle( fontSize: 12 , fontFamily: 'Normal',),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                                      )
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Expanded(
                              child: memberData.status !=0 ? (check =="1"?
                              ListView.builder(
                                  itemCount:memberData.data?.length,
                                  itemBuilder: (BuildContext context,int index){
                                    // List<ExecutiveMemberDesignation>? emData = memberData.data?[index].executiveMemberDesignation.sort((a, b) => a.order.compareTo(b.order));
                                   // emData?.sort();
                                    memberData.data?[index].executiveMemberDesignation.sort((a, b) => a.order.compareTo(b.order));
                                    // emData?.sort((a, b) => a.order.compareTo(b.order));
                                    // debugPrint("$emData");
                                   // emData?.sort((a, b) => a.order.compareTo(b.order));
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
                                      child: Column(
                                        children: [
                                          Card(
                                            elevation: 1,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Alpha_detail_Page(value :memberData.data?[index].id,)),)
                                                    .then((val)=>{_getRequests()});
                                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value :memberData2[index].id,) ));
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
                                                                child:  Container(child: memberData.data?[index].image == "" ?
                                                                CircleAvatar(backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                                                                    :
                                                                CircleAvatar(radius: 30.0,backgroundImage: NetworkImage(memberData.data![index].image),),)),
                                                          ),
                                                          Expanded(
                                                            child: Stack(
                                                              children: [
                                                                Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Container(
                                                                      padding: EdgeInsets.all(4),
                                                                      child:  Text(
                                                                        memberData.data?[index].name ??"",
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
                                                                      child: Row(
                                                                        children: [
                                                                          Text(
                                                                            memberData.data![index].executiveMemberDesignation.length>0? "${memberData.data?[index].executiveMemberDesignation[0].name}  ":"",
                                                                            maxLines: 2,
                                                                            overflow: TextOverflow.clip,
                                                                            style:
                                                                            TextStyle(fontSize: 14,
                                                                              color: memberData.data![index].executiveMemberDesignation[0].order=="1"?AppColors.maroonColor:Colors.black,
                                                                              fontFamily: 'Normal',),
                                                                          ),
                                                                          memberData.data![index].executiveMemberDesignation.length>1? Row(
                                                                            children: [
                                                                              CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.4),),
                                                                              SizedBox(width: 2,),
                                                                              CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.6),),
                                                                              SizedBox(width: 2,),
                                                                              CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.8),),
                                                                              Text(" +${memberData.data![index].executiveMemberDesignation.length-1}",style: TextStyle(color: Colors.black,fontSize: 14.0),),
                                                                            ],
                                                                          ):SizedBox()
                                                                        ],
                                                                      ),

                                                                    )
                                                                  ],
                                                                ),
                                                                Padding(padding:EdgeInsets.only(right: 10,top: 10.0),child: Align(alignment:Alignment.bottomRight,child: Icon(Icons.navigate_next,size: 30.0,color: AppColors.maroonColor,))),
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

                              )
                                  :
                              memberData2.length>0?ListView.builder(
                                  itemCount:memberData2.length,
                                  itemBuilder: (BuildContext context,int index){
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 4.0),
                                      child: Column(
                                        children: [
                                          Card(

                                            elevation: 1,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Alpha_detail_Page(value :memberData2[index].id,)),)
                                                    .then((val)=>{_getRequests()});
                                                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value :memberData2[index].id,) ));
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
                                                                child:  Container(child: memberData2[index].image == "" ?
                                                                CircleAvatar(backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                                                                    :
                                                                CircleAvatar(radius: 30.0,backgroundImage: NetworkImage(memberData2[index].image),),)),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  padding: EdgeInsets.all(4),
                                                                  child:  Text(
                                                                    memberData2[index].name??"",
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
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        memberData2[index].executiveMemberDesignation.length>0? "${memberData2[index].executiveMemberDesignation[0].name}  ":"",
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.clip,
                                                                        style:
                                                                        TextStyle(fontSize: 14,
                                                                          color: memberData2[index].executiveMemberDesignation[0].order=="1"?AppColors.maroonColor:Colors.black,
                                                                          fontFamily: 'Normal',),
                                                                      ),
                                                                      memberData2[index].executiveMemberDesignation.length>1? Row(
                                                                        children: [
                                                                          CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.4),),
                                                                          SizedBox(width: 2,),
                                                                          CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.6),),
                                                                          SizedBox(width: 2,),
                                                                          CircleAvatar(radius:4,backgroundColor: AppColors.maroonColor.withOpacity(0.8),),
                                                                          Text(" +${memberData2[index].executiveMemberDesignation.length-1}",style: TextStyle(color: Colors.black,fontSize: 14.0),),
                                                                        ],
                                                                      ):SizedBox()
                                                                    ],
                                                                  ),

                                                                )
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

                              ):Center(
                                child: Text("Data not found."),
                              )
                              )
                             :Center(
                                child: Text(
                                    memberData.msg??"",style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600
                                ),
                                ),
                              ),
                            ),
                          ],
                        )
                    ),


                  ],

                )

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