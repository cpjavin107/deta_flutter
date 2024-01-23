
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controllers/addchild_controller.dart';
import '../../controllers/deletechild_controller.dart';
import '../../controllers/memberprofile_controller.dart';
import '../../controllers/update_member_controller.dart';
import '../../res/colors/appcolors.dart';
import '../../models/memberprofile_model.dart';
import '../member/members.dart';
// ignore_for_file: prefer_const_constructors

class Edit_detail_Page extends StatefulWidget{
  String? value;

  Edit_detail_Page({Key? key,  this.value}) : super(key : key );
  @override
  State<Edit_detail_Page> createState() => _Alpha_detail_PageState(value!);
}

MemberProfileController? profileController ;
late MemberProfileModel profileData;

Future<dynamic> getProfile(String value) async {
  profileController = Get.put(MemberProfileController());

  return   profileController?.fetchProducts(value);
}

class _Alpha_detail_PageState extends State<Edit_detail_Page> {
  String? value;
  String member_id="";
  bool changeButton = false;
  ScaffoldMessengerState? scaffoldMessenger ;
  File? imageFile;
  String imagePath= "";

  _Alpha_detail_PageState(this.value);

  @override
  void initState() {
    super.initState();
    fetchUserDetail();
  }



  imageFromGallery() async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: ImageSource.gallery, maxHeight: 200, maxWidth: 200);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
        imageFile = File(pickedFile.path);
        uploadFile(imageFile!);
      });
    }
  }


  uploadFile(File imageFile) async {
    var uri = Uri.http('japps.co.in', '/kalinga/nismwa_api/index.php/Member/imageUpload');
    var request1 = http.MultipartRequest('POST', uri)
      ..fields['member_id'] = member_id
      ..files.add(await http.MultipartFile.fromPath(
          'image', imagePath,));
    var response = await request1.send();
    if (response.statusCode == 200){
      scaffoldMessenger?.showSnackBar(SnackBar(content:Text("Profile Image Updated Successfully")));
      Navigator.pop(context,true);

    }else{
      scaffoldMessenger?.showSnackBar(SnackBar(content:Text("Please try again!")));
    }
  }



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _memberTimeLineController = TextEditingController();
  final TextEditingController _spouseNameController = TextEditingController();

  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();

  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _datejoinController = TextEditingController();
  final TextEditingController _anniversaryController = TextEditingController();

  final TextEditingController _presentAddressController = TextEditingController();
  final TextEditingController _officeAddressController = TextEditingController();
  final TextEditingController _permanentAddressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _otherController = TextEditingController();
   TextEditingController _childNameController = TextEditingController();
   TextEditingController _childRemarkController = TextEditingController();

  fetchUserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    member_id = prefs.getString('member_id') ?? '';
  }


  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Children', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold,)),
            content: Column(
              children: [
                //name
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Children Name:"
                      , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // onChanged: (value) {
                      //   setState(() {
                      //     name = value;
                      //   });
                      // },
                      controller: _childNameController,
                      style: const TextStyle(fontSize: 12.0,color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Enter Children Name",
                        hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.redAccent)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Children Name cannot be empty";
                        }
                        return null;
                      },

                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                //Reamrk
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Children Remark:"
                      , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                        // onChanged: (value) {
                        //   setState(() {
                        //     remark = value;
                        //   });
                        // } ,
                      controller: _childRemarkController,
                      style: const TextStyle(fontSize: 12.0,color: Colors.black),
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Enter Children Remark",
                        hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.redAccent)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Children Remark cannot be empty";
                        }
                        return null;
                      },

                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

              ],
            ),
            actions: <Widget>[
              Material(
                color: Colors.red,
                borderRadius:
                BorderRadius.circular(8),
                child: InkWell(
                  onTap:() {
                    setState(() {
                      Navigator.pop(context);
                    });
                    },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width:  80 ,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.green,
                borderRadius:
                BorderRadius.circular(8),
                child: InkWell(
                  onTap:() {
                    setState(() {
                      AddChild();
                      Navigator.pop(context);
                    });
                    },
                  child:  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width:  80 ,
                    height: 40,
                    alignment: Alignment.center,
                    child: const Text(
                      "OK",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                      ),
                    ),
                  ),
                ),
              ),
            ],
            actionsAlignment: MainAxisAlignment.end
          );
        });
  }
  String? Name,Remark;
  String? name,remark;

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    return FutureBuilder(
        future:Future.wait([getProfile(value!)]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData){
            profileData = snapshot.data[0];
            return Scaffold(
              appBar: AppBar(
                title: Text("Edit Details"),
                elevation: 0.0,
                backgroundColor: AppColors.maroonColor,
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Form(
                key: _formkey,
                child: Stack(
                  fit: StackFit.expand,
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Center(
                        child: profileData.status != 0 ?
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: profileData.data?.length,
                          itemBuilder: (context, index) {
                            _idController.text = profileData.data![index].memberId??"";
                            _nameController.text = profileData.data?[index].name??"";
                            _mobileController.text = profileData.data?[index].mobileNumber??"";
                            _emailController.text = profileData.data?[index].email??"";
                            _memberTimeLineController.text = profileData.data?[index].designation??"";
                            _dobController.text = profileData.data?[index].dob??"";
                            _spouseNameController.text = profileData.data?[index].name??"";
                            _presentAddressController.text = profileData.data?[index].address??"";
                            _officeAddressController.text = profileData.data?[index].address??"";
                            _permanentAddressController.text = profileData.data?[index].address??"";
                            _fatherNameController.text = profileData.data?[index].fatherName??"";
                            _motherNameController.text = profileData.data?[index].fatherName??"";
                            _datejoinController.text = profileData.data?[index].dob??"";
                            _anniversaryController.text = profileData.data[index].mobileNumber??"";
                            _otherController.text = profileData.data?[index].address??"";

                            return Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    imageFile == null ?  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border(right: BorderSide(width: 1.0, color: Colors.white24))),
                                        child: Container(child: profileData.data[index].imageUrl == "" ?
                                        CircleAvatar(radius: 50.0,backgroundImage:AssetImage("assets/images/profile_icon.png"),)
                                            :
                                        CircleAvatar(radius: 50.0,backgroundImage: NetworkImage(profileData.data?[index].imageUrl??""),),),),
                                    ):Text(""),
                                     imageFile != null ? ClipRRect(
                                       borderRadius: BorderRadius.circular(48.0),
                                       child: Container(
                                        height: 100,
                                        width: 100,
                                         child:Image.file(
                                          imageFile!,
                                          fit: BoxFit.cover,
                                        ),
                                    ),
                                     ):Text(""),
                                    Padding(
                                      padding:  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 32.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Material(
                                            color: AppColors.maroonColor,
                                            borderRadius:
                                            BorderRadius.circular(changeButton ? 50 : 8),
                                            child: InkWell(
                                              onTap:() async {
                                                imageFromGallery();
                                              },
                                              child: AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                width: changeButton ? 50 : 150,
                                                height: 30,
                                                alignment: Alignment.center,
                                                child: changeButton
                                                    ? const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ) : const Text(
                                                  "Update Image",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //members name
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name of The Member:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _nameController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Name",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Name cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //executive_patron_life_member
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Executive/Patron/Life Member:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _memberTimeLineController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter executive_patron_life_member",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "executive_patron_life_member cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //dob
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date of Birth:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                onTap:() async{
                                                  DateTime? pickedDate = await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(), //get today's date
                                                      firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101)
                                                  );
                                                  if(pickedDate !=null){
                                                    String formetdate = DateFormat("dd-MM-yyyy").format(pickedDate);
                                                    _dobController.text = formetdate.toString();

                                                  }else{
                                                    print("Date not selected");
                                                  }

                                                },
                                                readOnly: true,
                                                controller: _dobController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Date of Birth",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Date of Birth cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //spouse
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                " Name of Spouse:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _spouseNameController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Spouse Name",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Spouse Name cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //present address
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Present Address:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _presentAddressController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Present Address",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Present Address cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //office address
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "office Address:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _officeAddressController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter office Address",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "office Address cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //permanent address
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Permanent Address:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _permanentAddressController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Permanent Address",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Permanent Address cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //father Name
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Father Name:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _fatherNameController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Father Name",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Father Name cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //mother Name
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Mother Name:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _motherNameController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Mother Name",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Mother Name cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          //date of joining
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Date of Joining:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                onTap:() async{
                                                  DateTime? pickedDate = await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(), //get today's date
                                                      firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101)
                                                  );
                                                  if(pickedDate !=null){
                                                    String formetdate = DateFormat("dd-MM-yyyy").format(pickedDate);
                                                    _datejoinController.text = formetdate.toString();

                                                  }else{
                                                    print("Date not selected");
                                                  }

                                                },
                                                readOnly: true,
                                                controller: _datejoinController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Joining Date",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Joining Date cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),

                                          //marriage Anniversary
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Marriage Anniversary:"
                                                , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                onTap:() async{
                                                  DateTime? pickedDate = await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime.now(), //get today's date
                                                      firstDate:DateTime(1900), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101)
                                                  );
                                                  if(pickedDate !=null){
                                                    String formetdate = DateFormat("dd-MM-yyyy").format(pickedDate);
                                                    _anniversaryController.text = formetdate.toString();
                                                  }else{
                                                    print("Date not selected");
                                                  }

                                                },
                                                readOnly: true,
                                                controller: _anniversaryController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Marriage Anniversary",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Marriage Anniversary cannot be empty";
                                                  }
                                                  return null;
                                                },

                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),

                                          //other
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Other:"
                                                , style: TextStyle(fontSize: 13, color: Colors.blue, fontWeight: FontWeight.bold,),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              TextFormField(
                                                controller: _otherController,
                                                style: const TextStyle(fontSize: 12.0,color: Colors.black),
                                                keyboardType: TextInputType.text,
                                                decoration: const InputDecoration(
                                                  hintText: "Enter Other things",
                                                  hintStyle: TextStyle(fontSize: 12.0, color: Colors.grey),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                      borderSide: BorderSide(color: Colors.redAccent)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),

                                          //children
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Material(
                                                color: AppColors.maroonColor,
                                                borderRadius:
                                                BorderRadius.circular(8),
                                                child: InkWell(
                                                  onTap:() {
                                                    _displayTextInputDialog(context);
                                                    },
                                                  child: AnimatedContainer(
                                                    duration: Duration(seconds: 1),
                                                    width:  55 ,
                                                    height: 25,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      "Add Child",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 9
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),


                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Children:"
                                                    , style: TextStyle(fontSize: 13, color: AppColors.maroonColor, fontWeight: FontWeight.bold,),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            physics: BouncingScrollPhysics(),
                                            child: Container(
                                              height: 200,
                                              // child: Childrens(profileData.data[index].!),
                                            ),
                                          ),




                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding:  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Material(
                                            color: Colors.blue,
                                            borderRadius:
                                            BorderRadius.circular(changeButton ? 50 : 8),
                                            child: InkWell(
                                              onTap:() {
                                               print(imageFile);
                                               if(_formkey.currentState!.validate())
                                               {
                                                  UpdateMemeberDetails();
                                                  print("Successful");
                                                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Members_List() ));

                                               }else
                                               {
                                                 // print("Unsuccessfull");
                                               }
                                              },
                                              child: AnimatedContainer(
                                                duration: Duration(seconds: 1),
                                                width: changeButton ? 50 : 150,
                                                height: 40,
                                                alignment: Alignment.center,
                                                child: changeButton
                                                    ? const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ) : const Text(
                                                  "SUBMIT",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14

                                                  ),

                                                ),


                                              ),
                                            ),
                                          ),


                                        ],
                                      ),
                                    ),


                                  ],
                                ),
                              ),

                            );

                          },
                        ):
                        Text("Member profile not found!", style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold,),),

                      ),
                    )
                  ],

                ),
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


  Future UpdateMemeberDetails()  async{
    UpdateMemberController enquiryController ;
    enquiryController = Get.put(UpdateMemberController());
    return enquiryController.fetchProducts(_idController.text,_nameController.text,
        _memberTimeLineController.text,_spouseNameController.text,_fatherNameController.text,_motherNameController.text,
        _dobController.text,_datejoinController.text,_anniversaryController.text,_presentAddressController.text,
        _officeAddressController.text,_permanentAddressController.text,_mobileController.text,_emailController.text,_otherController.text);

  }

  Future AddChild() async {
    AddChildController enquiryController ;
    enquiryController = Get.put(AddChildController());
    return enquiryController.fetchProducts(_idController.text,_childNameController.text,_childRemarkController.text);

  }

  Future DeleteChild(String? id) {
    DeleteChildController enquiryController;
    enquiryController = Get.put(DeleteChildController());
    return enquiryController.fetchProducts(id!);
  }

 /* Childrens(List<ChildrenDetails> childrenDetails) {
    return ListView.builder(
        itemCount:childrenDetails.length,
        itemBuilder: (BuildContext context,int index){
          return  Card(
            color: Colors.grey[50],
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 8.0),
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
                  Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(icon: new Icon(Icons.delete,size: 20.0,color: Colors.red,),
                        onPressed: () {
                          setState(() {
                            DeleteChild(childrenDetails[index].id);
                           // Navigator.pop(context);
                          });


                        },)

                  ),


                ],
              ),
            ),
          );

        }

    );
  }*/

}





