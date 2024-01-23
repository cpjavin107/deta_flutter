import 'package:deta/pages/management/management_screen.dart';
import 'package:deta/pages/management/office_bearers_meneber_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deta/pages/alphabetical_search/alphabet_list.dart';
import 'package:deta/pages/committee/main_page.dart';
import 'package:deta/pages/enquiry/add_enquiry_page.dart';
import 'package:deta/pages/enquiry/enquiry.dart';
import 'package:deta/pages/holiday/holidat_list.dart';
import 'package:deta/pages/home/home_page.dart';
import 'package:deta/pages/login_pages.dart';
import 'package:deta/pages/member/member_page.dart';
import 'package:deta/pages/member/members.dart';
import 'package:deta/pages/news_and_events/news_page.dart';
import 'package:deta/pages/splase.dart';
import 'package:deta/pages/useful_details/select_useful_details.dart';
import 'package:deta/res/routes/named_routes.dart';
import 'package:deta/res/routes/my_routes.dart';
import 'package:deta/res/theme/themes.dart';
import 'package:overlay_support/overlay_support.dart';
// ignore_for_file: prefer_const_constructors

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp( MyApp());
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');
  }
}
/*class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:ManagementScreen(),
    );
  }
}*/


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: GetMaterialApp(
        themeMode: ThemeMode.light,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.splaseRoute,
        routes: NamedRoutes.routeMap,
      ),
    );
  }
}


