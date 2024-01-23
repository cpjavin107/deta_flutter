import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:deta/controllers/subscribsion_controller.dart';

import '../../res/colors/appcolors.dart';
class SubscriptionFrom extends StatefulWidget {
  var planId;
   SubscriptionFrom({super.key,required this.planId});

  @override
  State<SubscriptionFrom> createState() => _SubscriptionFromState();
}

class _SubscriptionFromState extends State<SubscriptionFrom> {
  SubscribsionController subscribsionController=Get.put(SubscribsionController());
  String? mobile;
  List<String> imageSource = ['Camera', 'Gallery'];
  File? imageFile;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0,left: 10.0),
                child: Text(
                  "Please make payment and fill details below",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              explain('Enter Name ', subscribsionController.nameController,0),
              SizedBox(height: 20.0,),
              explain('Enter Phone Number', subscribsionController.mobileController,1),
              SizedBox(height: 20.0,),
              explain('Enter Transaction Id', subscribsionController.transactionController,1),
              const SizedBox(height: 10),
              Container(
                height: 120.0,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5.0,),
                    imageFile!=null?Image.file(imageFile!,width: MediaQuery.of(context).size.width*0.4, height: 60.0,):const SizedBox(),
                    const Spacer(),
                    TextButton.icon(     // <-- TextButton
                      onPressed: ()async {
                        int? choice = await showDialog(
                            context: context,
                            builder: (context) =>
                                SelectImageSource(imageSource));
                        if (choice != null) {
                          if (choice == 0) {
                            //source camera
                            XFile? pickedFile = await picker.pickImage(
                                source: ImageSource.camera);
                            if (pickedFile?.path == null) {
                              return;
                            }
                            imageFile = File(pickedFile!.path);

                          } else {
                            XFile? pickedFile = await picker.pickImage(
                                imageQuality: 40,
                                source: ImageSource.gallery);
                            imageFile = File(pickedFile!.path);
                          }
                          List<int> imageBytes = imageFile!.readAsBytesSync();
                          subscribsionController.base64Image = base64Encode(imageBytes);
                          setState(() {});
                        }
                      },
                      icon: const Icon(
                        Icons.upload,
                        size: 24.0,
                      ),
                      label: const Text('Upload Payment Slip'),
                    ),
                    const SizedBox(width: 30.0,)
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: (){
                  subscribsionController.validation(widget.planId);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.maroonColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:const Text(
                    'Get Membership',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 's',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Padding explain(lableTxt, controller,check) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        keyboardType: check==1?TextInputType.number:TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: lableTxt,
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Colors.grey)),
        ),
      ),
    );
  }

}
class SelectImageSource extends StatelessWidget {
  List<String> list = [];

  SelectImageSource(this.list);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Select Image Source",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ListView.separated(
              itemCount: list.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Container(
                height: 1,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey.shade300,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pop(context, index);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            list[index],
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                        )
                      ],
                    ),
                  ),
                );
              }),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
