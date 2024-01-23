import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/helper/My_Toast.dart';
import 'package:deta/pages/matrimonial/MatrimonialSignup.dart';
import '../../res/colors/appcolors.dart';


class ShowAllUsers extends StatefulWidget {
  const ShowAllUsers({super.key});
  @override
  State<ShowAllUsers> createState() => _ShowAllUsersState();
}

class _ShowAllUsersState extends State<ShowAllUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All users'),
          elevation: 0.0,
          backgroundColor: AppColors.maroonColor,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CustomDailyPage();
              }),
        ));
  }
}

class CustomDailyPage extends StatelessWidget {
  CustomDailyPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(MatrimonialSignUpScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
        ),
        elevation: 5.0,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 20.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "user name",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "On behalf",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "email id",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(child: IconButton(onPressed: () {MyToast.toast("edit");}, icon: Icon(Icons.edit_note_outlined,color: Colors.green,))),
                        Expanded(child: IconButton(onPressed: () {MyToast.toast("delete");}, icon: Icon(Icons.delete_outlined,color: Colors.redAccent,)))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
