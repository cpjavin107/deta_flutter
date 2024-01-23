import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:deta/helper/exit_popup.dart';
import 'package:deta/pages/home/component/body.dart';
import 'package:deta/pages/home/component/drawer_list.dart';
import 'package:deta/res/colors/appcolors.dart';
import 'package:deta/models/adssecond.dart';
import 'package:deta/res/theme/font_size.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import '../../controllers/adstwo_controller.dart';
import '../../models/push_notification.dart';
import '../../widgets/bg_image.dart';
import '../../widgets/big_image.dart';
import 'package:rxdart/rxdart.dart';

import '../notification/notification_list.dart';
import '../select_page.dart';

class Home_Page extends StatefulWidget{
  @override
  State<Home_Page> createState() => _Home_PageState();
}
//enum Availability { loading, available, unavailable }


class _Home_PageState extends State<Home_Page> {

  var res, ads,mobile;
  String member_id="",name="",image="",email="";
  AdsTwoController adsController = Get.put(AdsTwoController());
  List<Ads> adsData = [];
  final _messageStreamController = BehaviorSubject<RemoteMessage>();
  // final InAppReview _inAppReview = InAppReview.instance;
  //
  // String _appStoreId = '';
  // String _microsoftStoreId = '';
  // Availability _availability = Availability.loading;

  @override
  void initState() {
    super.initState();
    registerNotification();
  }

  void registerNotification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');

      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        showSimpleNotification(
          Text(notification.title??""),
          leading: NotificationBadge(totalNotifications: 1),
          subtitle: Text(notification.body??""),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 10),
        );
        _messageStreamController.sink.add(message);
        print(notification.title);

        setState(() {
          // _notificationInfo = notification;
          print(notification.title);
        });
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }
  String _lastMessage = "";

  _Home_PageState() {
    _messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          _lastMessage = 'Received a notification message:'
              '\nTitle=${message.notification?.title},'
              '\nBody=${message.notification?.body},'
              '\nData=${message.data}';
        } else {
          _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  // Future<bool> checkInternetConnectivity() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     // No internet connection.
  //     return false;
  //   } else {
  //     // Connected to mobile data or Wi-Fi.
  //     return true;
  //   }
  // }

  Future<dynamic> getAds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    mobile = prefs.getString('mobileNumber') ?? '';
    member_id = prefs.getString('member_id') ?? '';
    name = prefs.getString('name') ?? '';
    image = prefs.getString('image') ?? '';
    email = prefs.getString('email') ?? '';
    return adsController?.fetchProducts(member_id);
  }


  @override
  Widget build(BuildContext context) {

      return WillPopScope(
        onWillPop: () => ExitPopup.showExitPopup(context),
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: SizedBox(height:40,width:40,child: Image.asset("assets/images/logo.png"))), elevation: 0.0, backgroundColor: AppColors.maroonColor,
            iconTheme: IconThemeData(color: Colors.white),
            actions: [
              Visibility(
                  visible: true,
                  child: IconButton(
                    onPressed: () {
                      member_id == "" ?
                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Select()))
                          : Navigator.of(context).push(MaterialPageRoute(builder: (context) => Notification_list(value :member_id,) ));
                    },
                    icon: Icon(Icons.notifications,color: Colors.white,),
                  ))
            ],
          ),
          body: Stack(fit: StackFit.expand,
              children:<Widget> [
                BgImage(),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child:  Body(),
                )
              ]
          ) ,
          drawer: Theme(data: Theme.of(context).copyWith(canvasColor: Colors.white,),
            child: DrawerList(),
          ),
          bottomNavigationBar: FutureBuilder(
              future:Future.wait([getAds()]),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
                  if(snapshot.hasData){
                      adsData = snapshot.data[0];
                      return Padding(
                        padding: EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                  Big_Image(value : adsData[0].bigImage??"") ));
                            },
                            child: Image.network(adsData[0].smallImage??""),  ),

                      );

                  }else{
                    return Padding(padding: EdgeInsets.all(10.0),
                        child: Text("Loading....",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 20,

                          ),
                        )
                    );
                }
              }
            ),

          // BottomNavigation(image: adsData[0].bigImage),


        ),
      );
    }
}


    // (<T>(T o) => o)(WidgetsBinding.instance).addPostFrameCallback((_) async {
    //   try {
    //     final isAvailable = await _inAppReview.isAvailable();
    //
    //     setState(() {
    //       // This plugin cannot be tested on Android by installing your app
    //       // locally. See https://github.com/britannio/in_app_review#testing for
    //       // more information.
    //       _availability = isAvailable && !Platform.isAndroid
    //           ? Availability.available
    //           : Availability.unavailable;
    //     });
    //   } catch (_) {
    //     setState(() => _availability = Availability.unavailable);
    //   }
    // });

  // void _setAppStoreId(String id) => _appStoreId = id;
  //
  // void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;
  //
  // Future<void> _requestReview(BuildContext context) => _inAppReview.requestReview();
  //
  // Future<void> _openStoreListing() => _inAppReview.openStoreListing(
  //   appStoreId: _appStoreId,
  //   microsoftStoreId: _microsoftStoreId,
  // );
// }

class NotificationBadge extends StatelessWidget {
  final int totalNotifications;

  const NotificationBadge({ required this.totalNotifications});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$totalNotifications',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
