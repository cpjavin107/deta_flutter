import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../widgets/bg_image.dart';
import '../../widgets/big_image.dart';
import '../alphabetical_search/list_user_details.dart';
// ignore_for_file: prefer_const_constructors

class Tab_Member extends StatefulWidget{
  @override
  State<Tab_Member> createState() => _Tab_MemberState();
}

class _Tab_MemberState extends State<Tab_Member> {
  var api = Uri.parse("http://japps.co.in/kalinga/nismwa_api/index.php/Member/getAllManagementMembersByPriority");
  var res, list,ads;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    Map data = {
      'page':'2',
      'ownerId':'5',
      'priority':'2',


    };
    res = await http.post(api, body: data);
    list = jsonDecode(res.body)["data"];
    ads = jsonDecode(res.body)["ads"];
    print(list.toString());
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children:<Widget> [
            BgImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Center(
                child: res != null ? ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    var data = list[index];
                    return Card(
                      color: Colors.black,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Alpha_detail_Page(value :"${data["memberId"]}",) ));
                          },
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),

                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage('${data["image"]}'),),),

                          title: Text("${data["mc_name"]}", style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold,),),
                          subtitle: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //  Text("${data["name"]}", style: const TextStyle(fontSize: 10, color: Colors.white,),),
                              Text("${data["designationName"]}", style: const TextStyle(fontSize: 10, color: Colors.white,),),
                            ],
                          ),
                        ),
                      ),
                    );

                  },
                ): CircularProgressIndicator(backgroundColor: Colors.white),
              ),
            )
          ],

        ), bottomNavigationBar: Padding(
      padding: EdgeInsets.all(10.0),
      child:
      InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Big_Image(value :'${ads[0]["big_image"]}',) ));
            },
          child: Image.network('${ads[0]["small_image"]}',)),
    ),

    );

  }
}