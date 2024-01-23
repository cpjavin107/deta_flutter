import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:deta/helper/My_Toast.dart';
import 'package:deta/models/subscribtion/res_membershipa_data.dart';
import 'package:deta/pages/subscribetion_page/subscribsion_form.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/subscribsion_controller.dart';
import '../../res/colors/appcolors.dart';
class SubscriptionPage extends StatefulWidget {
  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}
class _SubscriptionPageState extends State<SubscriptionPage> {
  SubscribsionController subscribsionController=Get.put(SubscribsionController());
  @override
  void initState() {
    super.initState();
    subscribsionController.getMembersData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'),
        elevation: 0.0,
        backgroundColor: AppColors.maroonColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:Container(
        padding: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Obx(
          ()=> subscribsionController.loading.value? Center(child: CircularProgressIndicator(),):subscribsionController.membershipsList.length>0? ListView.builder(
              itemCount: subscribsionController.membershipsList.length,
              itemBuilder: (BuildContext context, int index) {
                return subscribsionController.membershipsList.isNotEmpty?SubscriptionCard(planName: subscribsionController.membershipsList[index].title, price: "${subscribsionController.membershipsList[index].price}/${subscribsionController.membershipsList[index].duration}", description: subscribsionController.membershipsList[index].description, planId: subscribsionController.membershipsList[index].id, status:subscribsionController.membershipsList[index].status, expireDate: subscribsionController.membershipsList[index].endDate, payment: subscribsionController.membershipsList[index].payment,):Container();
              }):Center(child: Text("No Membership Plan Available"),),
        ),
      ),
    );
  }
}
class ValidMembership extends StatelessWidget {
  const ValidMembership({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Lottie.asset('assets/rive_animations/validM.json',),
          Text("Your Membership Plan is Active",style: TextStyle(fontSize: 20.0,color: AppColors.maroonColor),)
        ],
      ),
    );
  }
}
class SubscriptionCard extends StatelessWidget {
  final String planName;
  final String price;
  final String description;
  final String status;
  final String expireDate;
  final String planId;
  final List<Payment> payment;

  const SubscriptionCard({
    required this.planName,
    required this.price,
    required this.description,
    required this.planId,
    required this.status, required this.expireDate,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              planName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              price,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                TextButton(
                  // style: ButtonStyle(backgroundColor: status=="Active"?MaterialStateProperty.all(Colors.green):MaterialStateProperty.all(Colors.red)),
                  onPressed: () {
                      if(status=="Inactive"){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            SubscriptionFrom(planId: planId,) ));
                      }
                  },
                  child: payment.length>0?payment[0].status=="under_processing"?Text(' Your payment is under processing',style: TextStyle(color: Colors.orange,fontSize: 16.0,fontWeight: FontWeight.w800),):payment[0].status=="reject"?Text('Your payment has been rejected please contact admin.',style: TextStyle(color: Colors.red,fontSize: 12.0,fontWeight: FontWeight.w800),):payment[0].status=="Inactive"?Text('Get Membership ➤'): Text('✵ Activated \t Expiry on: ${DateFormat('dd-MM-yyyy').format(DateTime.parse(expireDate))} ',style: TextStyle(color: Colors.green,fontSize: 16.0,fontWeight: FontWeight.w800),):Text('Get Membership ➤'),
                ),
                Spacer(),
                // status=="Active"?Text("Expiry on: $expireDate", style: TextStyle(fontSize: 18.0,color: Colors.green,fontWeight: FontWeight.w800),):SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class MembershipPage extends StatefulWidget {
  @override
  _MembershipPageState createState() => _MembershipPageState();
}
class _MembershipPageState extends State<MembershipPage> {
  bool isMembershipAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Membership is ${isMembershipAvailable ? 'Available' : 'Not Available'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Toggle membership availability
                setState(() {
                  isMembershipAvailable = !isMembershipAvailable;
                });
              },
              child: Text('Toggle Membership'),
            ),
          ],
        ),
      ),
    );
  }
}