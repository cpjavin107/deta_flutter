import 'package:shared_preferences/shared_preferences.dart';

import '../contants/sp_constants.dart';

class SharedPref{
  static late SharedPreferences preferences ;

  static void getInstance() async{
    preferences = await SharedPreferences.getInstance();
  }

  static savePref(String id, String name, String email, String mobileNumber,String firm_name,String image,String type_name) async {
    preferences.setString(SpConstants.MEMBER_ID, id);
    preferences.setString(SpConstants.NAME, name);
    preferences.setString(SpConstants.EMAIL, email);
    preferences.setString(SpConstants.MOBILE_NUMBER, mobileNumber);
    preferences.setString(SpConstants.FIRM, firm_name);
    preferences.setString(SpConstants.IMAGE, image);
    preferences.setString(SpConstants.TYPE_NAME, type_name);
    preferences.commit();
  }

  static Map<String, dynamic> getPref(){
    Map<String, dynamic> map = {
      SpConstants.MEMBER_ID: preferences.getString(SpConstants.MEMBER_ID),
      SpConstants.NAME: preferences.getString(SpConstants.NAME),
      SpConstants.EMAIL: preferences.getString(SpConstants.EMAIL),
      SpConstants.MOBILE_NUMBER: preferences.getString(SpConstants.MOBILE_NUMBER),
      SpConstants.FIRM: preferences.getString(SpConstants.FIRM),
      SpConstants.IMAGE: preferences.getString(SpConstants.IMAGE),
      SpConstants.TYPE_NAME: preferences.getString(SpConstants.TYPE_NAME)
    };
    return map;
  }

  static userLogout(){
    // preferences.setString(SpConstants.MEMBER_ID, "");
    preferences.clear();
  }

  static getMemberId(){
    preferences.getString(SpConstants.MEMBER_ID);
  }

  static setMemberName(String name){
    preferences.setString(SpConstants.NAME, name);
  }


}