import 'package:flutter/material.dart';
import 'package:share/share.dart';
// import 'package:flutter_share/flutter_share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../contants/sp_constants.dart';
import '../../../helper/shared_pref.dart';
import '../../../res/colors/appcolors.dart';
import '../../alphabetical_search/list_user_details.dart';
import '../../drawer_all_pages/about_us.dart';
import '../../drawer_all_pages/help.dart';
import '../../select_page.dart';
import '../../subscribetion_page/subscribsion_screen.dart';
import '../home_page.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  var res, ads,mobile;
  String member_id="",name="",image="",email="";


  @override
  void initState(){
    super.initState();
    getAds();
    var map = SharedPref.getPref();
    mobile = map[SpConstants.MOBILE_NUMBER]??"";
    member_id = map[SpConstants.MEMBER_ID]??"";
    name = map[SpConstants.NAME]??"";
    image = map[SpConstants.IMAGE]??"";
    email = map[SpConstants.EMAIL]??"";

  }

  Future<dynamic> getAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString('mobileNumber') ?? '';
    member_id = prefs.getString('member_id') ?? '';
    name = prefs.getString('name') ?? '';
    image = prefs.getString('image') ?? '';
    email = prefs.getString('email') ?? '';
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>  [
          DrawerHeader(
            padding : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: AppColors.maroonColor,

            ),
            child: UserAccountsDrawerHeader(decoration: BoxDecoration(color: AppColors.maroonColor,),
              currentAccountPicture: Container( margin: const EdgeInsets.only( bottom: 12.0),child: member_id == "" ?
              CircleAvatar(backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                  :
              CircleAvatar(backgroundImage: NetworkImage(image),),),
              accountName: Container(child: member_id == "" ?
              Text("Register/Login", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,),
              ):Container(
                child: Text(name, style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              )
              ),
              accountEmail: Visibility(
                  visible:member_id == "" ? false:true,
                  child: Text(email)),
            ),
          ),
          Container(
            child: member_id == "" ?
            ListTile(
              title: Text("Home",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Select()));
              },
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
            ): ListTile(
              title: Text("Home",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home_Page() ));
              },
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
            ),
          ),
          Container(
              child: member_id == "" ? Visibility(
                visible: false,
                child:  Divider(color: Colors.black),
              ):Divider(color: Colors.black)
          ),
          Container(
              child:Visibility(
                visible: member_id == "" ?false : true,
                child: ListTile(
                  title: Text("Profile",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value : member_id,) ));
                  },
                  trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
                ),
              )
          ),
          Divider(color: Colors.black),
          ListTile(
            title: Text("Help & Support",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Help_Page()));
            },
            trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
          ),
          Divider(color: Colors.black),
          ListTile(
            title: Text("Invite",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              share(context);
            },
            trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
          ),
          Divider(color: Colors.black),
          ListTile(
            title: Text("Rate Us",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
                print("object");
              _requestReview();
              },
            trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
          ),
          /*Divider(color: Colors.black),
          ListTile(
            title: Text("Get Membership",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
              member_id == ""?Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Select())):Navigator.of(context).push(MaterialPageRoute(builder: (context) => SubscriptionPage()));
            },
            trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
          ),*/
          Divider(color: Colors.black),
          ListTile(
            title: Text("About App",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => About_Page()));
            },
            trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
          ),

          Divider(color: Colors.black),
          Container(
              child:
              Visibility(
                visible: member_id == "" ? false :true,
                child: ListTile(
                  title: Text("Logout", style: TextStyle(fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold,),
                  ),
                  onTap: () async {
                    SharedPreferences preferences = await SharedPreferences.getInstance();
                    preferences.clear();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => Select()));
                  },
                  trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.black),
                ),
              )
          ),
        ],
      ),
    );
  }

  // share(BuildContext context)  async {
  //   Share.share('Check out this cool app \n -> https://play.google.com/store/apps/details?id=com.vysya.kalinga ');
  //   // FlutterShare.share(
  //   //     title: 'Example share',
  //   //     text: 'Example share text',
  //   //     linkUrl: 'https://flutter.dev/',
  //   //     chooserTitle: 'Example Chooser Title'
  //   // );
  // }

  void share(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share("Check out this cool app \n https://play.google.com/store/apps/details?id=com.javinindia.deta",
        subject: "https://play.google.com/store/apps/details?id=com.javinindia.deta",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
  _requestReview() async{
    const String packageName = 'com.javinindia.deta';
    final String url = 'https://play.google.com/store/apps/details?id=$packageName';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
}
}


