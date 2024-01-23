import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../models/addenquiry_model.dart';
import '../models/adsfirst.dart';
import '../models/adssecond.dart';
import '../models/alphasearchmember_model.dart';
import '../models/committee_model.dart';
import '../models/contact_model.dart';
import '../models/getenquiry_model.dart';
import '../models/holiday_model.dart';
import '../models/member_model.dart';
import '../models/memberprofile_model.dart';
import '../models/news_model.dart';
import '../models/update_member.dart';
import '../models/useful_model.dart';


class RemoteServices {
  static var client = http.Client();



  static Future<AdsData?> fetchFilters() async {
    AdsData headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/mainAds';
    Map data = {
      'ownerId':'',
    };
    var body = json.encode(data);

    var response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
        body: body
       );


    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = AdsData.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<AdsTwoData?> fetchAds(String memberId) async {
    AdsTwoData headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/ads';
    Map data = {
      'ownerId':memberId,
    };
    var body = json.encode(data);
    var response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
        body: body
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = AdsTwoData.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }



  static Future<MemberData?> fetchMembers() async {
    MemberData headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllmembers';
    Map data = {
      "priority":"1",
      "ownerId":"",
      "ownerName":"",
      "firmName":"",
      "address":"",
      "deal":"",
      "block":""
    };
    var body = json.encode(data);
    print(body);
    var response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
        body: body
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = MemberData.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<Member2Data?> fetchCommittee() async {
    Member2Data headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllExecutiveCommitteeMembers';
    Map data = {};
    var body = json.encode(data);
    print(body);
    var response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
        body: body
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = Member2Data.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<HolidayModel?> fetchHoliday() async {
    HolidayModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/holidayCalendar';

    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';


    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = HolidayModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<UsefulModel?> fetchUseful() async {
    UsefulModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Masters/getAllUsefulMaster';

    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';


    var response = await http.post(Uri.parse(url)
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;

      headers  = UsefulModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }


  static Future<ContactModel?> fetchContact(String value) async {
    ContactModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getUsefulInformation';

    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';
    map['memberId'] = '5';
    map['masterInfoId'] = '9';


    var response = await http.post(Uri.parse(url),body:map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = ContactModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<AlphaMemberModel?> fetchAlphaMember(String member,String value) async {
    AlphaMemberModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllFirmOwnersBySearch';

    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';
     map['name'] = value;
    map['address'] = '';
    map['deal'] = '';
    map['firmName'] = value;
    map['block'] = '';
    map['ownerId'] = member;

  print("$map");
    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;

      headers  = AlphaMemberModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<EnquiryModel?> fetchEnquiry() async {
    EnquiryModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/enquiry_list';

    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';


    var response = await http.post(Uri.parse(url),);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = EnquiryModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }



  static Future<MemberProfileModel?> fetchProfile(String value) async {
    MemberProfileModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/ownerProfile';
    // from-data
    var map = new Map<String, dynamic>();
    map['memberId'] = value;

    debugPrint("$map");
    var response = await http.post(Uri.parse(url),body:map);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      headers  = MemberProfileModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<AddEnquiryModel?> addEnquiry(String title,String name,String mobile,String desc) async {
    AddEnquiryModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/addEnquiry';

    // from-data
    var map = new Map<String, dynamic>();
    map['mobile'] = mobile;
    map['title'] = title;
    map['name'] = name;
    map['description'] = desc;

print("$map");

    var response = await http.post(Uri.parse(url),body:map);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      headers  = AddEnquiryModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<NewsModel?> fetchNews() async {
    NewsModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/getAllNews';
    // from-data
    var map = new Map<String, dynamic>();
    map['page'] = '-1';


    var response = await http.post(Uri.parse(url),
        body: map
    );
    if (response.statusCode == 200) {
      var jsonString = response.body;
      headers  = NewsModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<UpdateMemberModel?> UpdateMember(String id,String name,String lifeline,String spouse,String father
      ,String mother,String dob,String join,String anniversary,String present,String office
      , String permanent, String mobile, String email,String other) async {
    UpdateMemberModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/updateMember';

    // from-data
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['contact_number'] = mobile;
    map['phone'] = mobile;
    map['email_id'] = email;
    map['name_of_the_member'] = name;
    map['name'] = name;
    map['executive_patron_life_member'] = lifeline;
    map['profession'] = lifeline;
    map['name_of_spouse'] = spouse;
    map['dob'] = dob;
    map['date_of_joining'] = join;
    map['marriage_anniversary'] = anniversary;
    map['present_address'] = present;
    map['address'] = present;
    map['office_address'] = office;
    map['permanent_address'] = permanent;
    map['father_name'] = father;
    map['mother_name'] = mother;
    map['receipt_no'] = "";
    map['receipt_no'] = "";
    map['deals_in_id'] = "2";
    map['deals_in_name'] = "Deals 2";
    map['executive_member_status'] = "0";
    map['executive_member_designation_id'] = "0";
    map['add_firm_detail_status'] = "0";
    map['executive_member_designation_name'] = "";
    map['firm_name'] = "";
    map['firm_address'] = "";
    map['firm_phone'] = "";
    map['firm_phone2'] = "";
    map['any_other_information'] = other;



    var response = await http.post(Uri.parse(url),body:map);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      headers  = UpdateMemberModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }



  static Future<UpdateMemberModel?> Children(String id,String name,String remark) async {
    UpdateMemberModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/addMemberChildren';

    // from-data
    var map = new Map<String, dynamic>();
    map['member_id'] = id;
    map['name'] = name;
    map['remark'] = remark;



    var response = await http.post(Uri.parse(url),body:map);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);

      headers  = UpdateMemberModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }

  static Future<UpdateMemberModel?> ChildrenDelete(String id) async {
    UpdateMemberModel headers;
    var url ='https://nritak.com/DETassociation/DETassociation_api/index.php/Member/deleteMemberChildren';

    var map = new Map<String, dynamic>();
    map['child_id'] = id;
    print(id);




    var response = await http.post(Uri.parse(url),body:map);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);

      headers  = UpdateMemberModel.fromJson(json.decode(jsonString));
      return headers;
    } else {
      print(response.body);
      return null;
    }
  }




}