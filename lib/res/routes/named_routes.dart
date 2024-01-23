import 'package:flutter/cupertino.dart';
import 'package:deta/res/routes/my_routes.dart';

import '../../pages/alphabetical_search/alphabet_list.dart';
import '../../pages/committee/main_page.dart';
import '../../pages/enquiry/add_enquiry_page.dart';
import '../../pages/enquiry/enquiry.dart';
import '../../pages/holiday/holidat_list.dart';
import '../../pages/home/home_page.dart';
import '../../pages/login_pages.dart';
import '../../pages/management/management_screen.dart';
import '../../pages/member/member_page.dart';
import '../../pages/member/members.dart';
import '../../pages/news_and_events/news_page.dart';
import '../../pages/select_page.dart';
import '../../pages/splase.dart';
import '../../pages/useful_details/select_useful_details.dart';
import '../../widgets/splase_ads.dart';

class NamedRoutes{


  static Map<String, Widget Function(BuildContext)> routeMap  = {
    MyRoutes.splaseRoute: (context) => SplashScreen(),
    MyRoutes.loginRoute: (context) => LoginPage(),
    MyRoutes.seleteHome: (context) => Home_Page(),
    MyRoutes.seleteenquiry: (context) => Enquiry(),
    MyRoutes.addenquiry: (context) => Add_Enquiry(),
    MyRoutes.selectUseful: (context) => Useful_Page(),
    MyRoutes.newsevent: (context) => News_Page(),
    MyRoutes.viewholiday: (context) => HoliDay_Page(),
    MyRoutes.alphasearch: (context) => Alphabet_List(),
    MyRoutes.members: (context) => Member_Page(),
    MyRoutes.committee: (context) => ManagementScreen(),
    MyRoutes.adsImage : (context) => Ads_Image(),
    MyRoutes.selectLoginOrGuest : (context) => Select(),
    // MyRoutes.alphasearchData: (context) => Alphabet_Search_Page(),
    // MyRoutes.alphasearchDataDetails: (context) => Alpha_detail_Page(),
    //MyRoutes.members: (context) => Member_Page(),

  };
}