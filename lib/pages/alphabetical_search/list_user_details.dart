
import 'package:deta/widgets/bg_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../controllers/memberprofile_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/memberprofile_model.dart';
import 'edit_member_details.dart';
// ignore_for_file: prefer_const_constructors

class Alpha_detail_Page extends StatefulWidget{
  String? value;

  Alpha_detail_Page({Key? key,  this.value}) : super(key : key );
  @override
  State<Alpha_detail_Page> createState() => _Alpha_detail_PageState(value!);
}

MemberProfileController? profileController ;
late MemberProfileModel profileData;

Future<dynamic> getProfile(String value) async {
  profileController = Get.put(MemberProfileController());
  return   profileController?.fetchProducts(value);
}
class _Alpha_detail_PageState extends State<Alpha_detail_Page> {
  String value;
  String member_id="";

  _Alpha_detail_PageState(this.value);

  @override
  void initState() {
    super.initState();
    fetchUserDetail();
  }

  fetchUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    member_id = prefs.getString('member_id') ?? '';
  }
  _getRequests()async{

    setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:Future.wait([getProfile(value)]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            print("\n\n\n${snapshot.data[0]}\n\n");
            profileData = snapshot.data[0];
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
                      child: profileData.status != 0 ?
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: profileData.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                           Container(
                             width:MediaQuery.of(context).size.width,
                             child: Card(
                               color:AppColors.mainColor,
                               child: Padding(
                                 padding: const EdgeInsets.all(16.0),
                                 child: Column(
                                   children: [
                                     member_id != "" ? Row(
                                       children: [
                                         member_id == profileData.data[index].memberId ? Container(
                                           child:  IconButton(
                                               onPressed: () async {
                                                 // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Edit_detail_Page(value :profileData.data[index].id,) ));
                                                 Navigator.of(context).push(new MaterialPageRoute(builder: (_)=>new Edit_detail_Page(value :profileData.data[index].memberId,)),)
                                                     .then((val)=>{_getRequests()});
                                               },
                                               icon: Icon(Icons.edit,size: 30, color:Colors.red)
                                           ),
                                         ):Text(""),
                                       ],
                                       mainAxisAlignment: MainAxisAlignment.end,
                                     ):Text(""),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                         child: Container(child: profileData.data[index].imageUrl == "" ?
                                         CircleAvatar(radius: 50.0,backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                                             :
                                         CircleAvatar(radius: 50.0,backgroundImage: NetworkImage(profileData.data[index].imageUrl??""),),),),
                                     ),
                                     SizedBox(
                                       height: 5,
                                     ),
                                     Column(
                                       mainAxisSize: MainAxisSize.min,
                                       crossAxisAlignment: CrossAxisAlignment.center,
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: <Widget>[
                                         Text("${profileData.data[index].firmName}",
                                           style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,)
                                           ,maxLines: 2,),

                                         SizedBox(height: 5,),
                                         Text(""+profileData.data[index].name!, style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),),
                                         SizedBox(height: 5,),
                                         Text("(${profileData.data[index].designation })", style: const TextStyle(fontSize: 12, color: Colors.white),),
                                         SizedBox(height: 5,),
                                         Text(
                                           "${profileData.data[index].address}",
                                           maxLines: 2,
                                           overflow: TextOverflow.clip,
                                           style:
                                           TextStyle(fontSize: 12,
                                             color: Colors.white,
                                             fontFamily: 'Normal',),
                                         ),
                                         // Text(profileData.data[index].address!, style: const TextStyle(fontSize: 9, color: Colors.black,),),

                                       ],
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           ),

                              SizedBox(height: 20,),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    profileData.data[index].mobileNumber!.isEmpty?print("empty"): launch('tel:${profileData.data[index].mobileNumber}');
                                  },
                                  leading: Container(
                                    padding: EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: Icon(Icons.smartphone, color: Colors.white),
                                  ),
                                  title: Text("Mobile:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text(profileData.data[index].mobileNumber!, style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                  trailing: Icon(Icons.call,size: 30, color:Colors.blueAccent),
                                ),
                              ),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    // profileData.data[index].officeContactNumber.isNotEmpty? launch('tel:${profileData.data[index].officeContactNumber}'):print("empty");
                                  },
                                  leading: Container(
                                    padding: EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: Icon(Icons.smartphone, color: Colors.white),
                                  ),
                                  title: Text("Firm No.:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text(profileData.data[index].officeContactNumber!, style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                  // trailing: Icon(Icons.call,size: 30, color:Colors.blueAccent),
                                ),
                              ),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    profileData.data[index].officeNumber!.isNotEmpty?launch('tel:${profileData.data[index].officeNumber}'):print("empty");
                                  },
                                  leading: Container(
                                    padding: EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: Icon(Icons.smartphone, color: Colors.white),
                                  ),
                                  title: Text("Firm Telephone No:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text("${profileData.data[index].officeNumber}", style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                  trailing: Icon(Icons.call,size: 30, color:Colors.blueAccent),
                                ),
                              ),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    profileData.data[index].email!.isNotEmpty ?  launch('mailto:${profileData.data[index].email}'):print("empty");
                                  },
                                  leading: Container(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: const Icon(Icons.mail, color: Colors.white),
                                  ),
                                  title: Text("E-mail:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text(profileData.data[index].email??"", style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                  trailing: Icon(Icons.forward_to_inbox,size: 30, color:Colors.blue),
                                ),
                              ),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    // launch('mailto:${profileData.data[index].email}');
                                  },
                                  leading: Container(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: const Icon(Icons.people_alt, color: Colors.white),
                                  ),
                                  title: Text("GST No.:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text(profileData.data[index].gstNumber??"", style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                ),
                              ),
                              Card(
                                color: AppColors.mainColor,
                                child: ListTile(
                                  onTap: () {
                                    // launch('mailto:${profileData.data[index].email}');
                                  },
                                  leading: Container(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            right: BorderSide(width: 1.0, color: Colors.white))),
                                    child: const Icon(Icons.production_quantity_limits, color: Colors.white),
                                  ),
                                  title: Text("DEALS IN:", style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.bold,),),
                                  subtitle:  Text("${profileData.data[index].dealsIn_1??""} ${profileData.data[index].dealsIn_2??""} ${profileData.data[index].dealsIn_3??""} ${profileData.data[index].dealsIn_4??""}", style: const TextStyle(fontSize: 14, color: Colors.white,),),
                                ),
                              ),
                              Container(
                                  child:  member_id == value ? Visibility(
                                    visible: false,
                                    child:   ListTile(
                                      title: Row(
                                        children: <Widget>[
                                          Expanded(child: ElevatedButton(onPressed: () {},
                                              child: SizedBox(child: Text("Add to Contact")))),
                                          SizedBox(width: 10,),
                                          // Expanded(child: ElevatedButton(onPressed: () async {
                                          //   await launch ("https://wa.me/918743007244?text=Hello");
                                          // },child:  SizedBox(child: Text("Share Contact")),)),
                                        ],
                                      ),
                                    ),
                                  ):
                                  Visibility(
                                    visible: true,
                                    child:     ListTile(
                                      title: Row(
                                        children: <Widget>[
                                          Expanded(child: ElevatedButton(onPressed: () {
                                          }, child: SizedBox(child: Text("Add to Contact")))),
                                          SizedBox(width: 10,),
                                          Expanded(child: ElevatedButton(onPressed: () async {
                                            await launch ("https://wa.me/918743007244?text=Hello");
                                          },child:  SizedBox(child: Text("Share Contact")))),
                                        ],
                                      ),
                                    ),
                                  )
                              ),

                            ],
                          );

                        },
                      ):
                      Text("Member profile not found!", style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold,),),

                    ),
                  )
                ],

              ),
              //   bottomNavigationBar: Padding(
              //   padding: EdgeInsets.all(10.0),
              //   child:
              //   InkWell(
              //       onTap: (){
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :'${ads[0]["big_image"]}',) ));
              //         },
              //       child: Image.network('${ads[0]["small_image"]}',)),
              // ),

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

/*
Childrens(List<ChildrenDetails> childrenDetails) {
  return ListView.builder(
      itemCount:childrenDetails.length,
      itemBuilder: (BuildContext context,int index){
        return  Card(
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(childrenDetails[index].name??"", style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 2,),
                Text( childrenDetails[index].remark??"", style: TextStyle(
                  fontSize: 9,
                  color: Colors.black,
                ),
                ),
                SizedBox(height: 2,),



              ],
            ),
          ),
        );

      }

  );
}*/
