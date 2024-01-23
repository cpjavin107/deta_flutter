import 'dart:collection';
class Constants{
  static const String TOKEN="token";
  static const String USERNAME="username";
  static const String PASSWORD="password";
  static const String NAME="name";
  static const String MOBILE_NO="mobile";
  static const String IMAGE_LINK="image";
  static  String myStartDate="";
  static  String myEndDate="";
  static  String showStartDate="";
  static  String showEndDate="";
  static final Map<String, int> stateNameToIDHashmap = HashMap();
  static final Map<int, String> stateIDToNameHashmap = HashMap();
  static final Map<String, int> cityNameToIDHashmap = HashMap();
  static final Map<int, String> cityIDToNameHashmap = HashMap();
  static final Map<String, int> onBehalfNameToIDHashmap = HashMap();
  static final Map<int, String> onBehalfIDToNameHashmap = HashMap();
  static final Map<String, int> educationNameToIDHashmap = HashMap();
  static final Map<int, String> educationIDToNameHashmap = HashMap();
  static final Map<String, int> bloodGroupNameToIDHashmap = HashMap();
  static final Map<int, String> bloodGroupIDToNameHashmap = HashMap();
}