import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:deta/helper/My_Toast.dart';

import '../../res/colors/appcolors.dart';

class ImageGrid extends StatefulWidget {
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<File> images = [];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (images.length < 6) {
          images.add(File(pickedFile.path));
        } else {
          MyToast.toast("You can upload only 6 pictures");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30.0,),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.maroonColor), // Set the background color
          ),
          onPressed: _pickImage,
          child: Text('Pick Image'),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Set the border color
                    width: 2.0,           // Set the border width
                  ),
                ),child: Image.file(images[index], fit: BoxFit.cover)),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0,),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: AppColors.maroonColor, // Background Color
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child:const Text(
                    'SAVE',
                    style: TextStyle(fontSize: 16.0,color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: AppColors.maroonColor, // Background Color
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0,right: 10.0),
                  child:const Text(
                    'NEXT',
                    style: TextStyle(fontSize:16.0,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30,)
      ],
    );
  }
}