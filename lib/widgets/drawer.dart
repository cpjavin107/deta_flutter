
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/drawer_all_pages/about_us.dart';
import '../pages/drawer_all_pages/help.dart';
import '../pages/select_page.dart';
// ignore_for_file: prefer_const_constructors

class MyDrawer extends StatefulWidget{
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
   String? mobile,member_id="",name="Register/Login" ,
      image ="assets/images/profile_bg.png";
   bool isShowListTile = true;

  @override
  void initState() {
    super.initState();
    fetchUserDetail();



  }
  fetchUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString('mobileNumber') ?? '';
    member_id = prefs.getString('member_id') ?? '';
    name = prefs.getString('name') ?? '';
    image = prefs.getString('image') ?? '';
    // print(name);
    // print(member_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>  [
             DrawerHeader(decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/profile_bg.png"),
                  fit: BoxFit.cover),
            ),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                currentAccountPicture: CircleAvatar(
                  child:Image.network(image!) ,

                ),
                accountName: Text(name!,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white, fontWeight: FontWeight.bold,),
                ),

                accountEmail: Text(""),

              ),
            ),



            ListTile(
              title: Text("Home",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Select() ));

              },
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
            ),


            Container(
              child: member_id == "" ? Visibility(
                visible: false,
                child: ListTile(
                  title: Text("Profile",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Select() ));
                  },
                  trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
                ),
              ):Visibility(
                visible: true,
                child: ListTile(
                  title: Text("Profile",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Select() ));
                  },
                  trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
                ),
              )
            ),



            Divider(color: Colors.white),
            ListTile(
              title: Text("Help & Support",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Help_Page()));
                },
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text("Invite",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),),
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
            ),

            Divider(color: Colors.white),
            ListTile(
              title: Text("Rate Us",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),),
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
            ),
            Divider(color: Colors.white),
            ListTile(
              title: Text("About App",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,

                ),),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => About_Page()));
              },
              trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
            ),

            Divider(color: Colors.white),
            Container(
                child: member_id == "" ? Visibility(
                  visible: false,
                  child: ListTile(
                    title: Text("Logout",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      SharedPreferences preferences = await SharedPreferences.getInstance();
                      preferences.clear();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => Select()));
                    },
                    trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
                  ),
                ):Visibility(
                  visible: true,
                  child: ListTile(
                    title: Text("Logout",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                        SharedPreferences preferences = await SharedPreferences.getInstance();
                        preferences.clear();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext ctx) => Select()));
                      },
                    trailing: Icon(Icons.keyboard_arrow_right,size: 30, color:Colors.white),
                  ),
                )
            ),



          ],
        ),
      ),
    );

  }
}