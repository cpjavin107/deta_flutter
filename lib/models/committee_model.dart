
class ChildrenDetails {
  String? id;
  String? memberId;
  String? name;
  String? remark;

  ChildrenDetails({ this.id,  this.memberId,  this.name,  this.remark});

  ChildrenDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['name'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_id'] = this.memberId;
    data['name'] = this.name;
    data['remark'] = this.remark;
    return data;
  }
}
class Member2Data {
  Member2Data({
    required this.status,
    required this.msg,
    required this.ads,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<dynamic> ads;
  late final List<Data> data;

  Member2Data.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    ads = List.castFrom<dynamic, dynamic>(json['ads']);
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['ads'] = ads;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.mcId,
    required this.ownerId,
    required this.designation,
    required this.mcJoiningDate,
    required this.mcEndingDate,
    required this.mcStatus,
    required this.addedDate,
    required this.mtMemberType,
    this.mcName,
    required this.name,
    required this.email,
    required this.address,
    required this.image,
    required this.phone,
    required this.profession,
    required this.dealsInId,
    required this.dealsInName,
    required this.executiveMemberDesignation,
    required this.executiveMemberStatus,
    this.executiveMemberDesignationId,
    this.executiveMemberDesignationName,
    required this.addFirmDetailStatus,
    required this.firmName,
    required this.firmAddress,
    required this.firmPhone,
    required this.firmPhone2,
    required this.firmEmail,
    this.firmLogo,
    required this.executivePatronLifeMember,
    required this.nameOfTheMember,
    required this.nameOfSpouse,
    required this.contactNumber,
    required this.dob,
    required this.anyOtherInformation,
    required this.dateOfJoining,
    required this.receiptNo,
    required this.marriageAnniversary,
    required this.emailId,
    required this.presentAddress,
    required this.officeAddress,
    required this.permanentAddress,
    required this.fatherName,
    required this.motherName,
    required this.childrenDetails,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String mcId;
  late final String ownerId;
  late final String designation;
  late final String mcJoiningDate;
  late final String mcEndingDate;
  late final String mcStatus;
  late final String addedDate;
  late final String mtMemberType;
  late final Null mcName;
  late final String name;
  late final String email;
  late final String address;
  late final String image;
  late final String phone;
  late final String profession;
  late final String dealsInId;
  late final String dealsInName;
  late final List<ExecutiveMemberDesignation> executiveMemberDesignation;
  late final String executiveMemberStatus;
  late final Null executiveMemberDesignationId;
  late final Null executiveMemberDesignationName;
  late final String addFirmDetailStatus;
  late final String firmName;
  late final String firmAddress;
  late final String firmPhone;
  late final String firmPhone2;
  late final String firmEmail;
  late final Null firmLogo;
  late final String executivePatronLifeMember;
  late final String nameOfTheMember;
  late final String nameOfSpouse;
  late final String contactNumber;
  late final String dob;
  late final String anyOtherInformation;
  late final String dateOfJoining;
  late final String receiptNo;
  late final String marriageAnniversary;
  late final String emailId;
  late final String presentAddress;
  late final String officeAddress;
  late final String permanentAddress;
  late final String fatherName;
  late final String motherName;
  List<ChildrenDetails>? childrenDetails;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    mcId = json['mc_id'];
    ownerId = json['owner_id'];
    designation = json['designation'];
    mcJoiningDate = json['mc_joining_date'];
    mcEndingDate = json['mc_ending_date'];
    mcStatus = json['mc_status'];
    addedDate = json['added_date'];
    mtMemberType = json['mt_member_type'];
    mcName = null;
    name = json['name'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
    phone = json['phone'];
    profession = json['profession'];
    dealsInId = json['deals_in_id'];
    dealsInName = json['deals_in_name'];
    executiveMemberDesignation = List.from(json['executive_member_designation']).map((e)=>ExecutiveMemberDesignation.fromJson(e)).toList();
    executiveMemberStatus = json['executive_member_status'];
    executiveMemberDesignationId = null;
    executiveMemberDesignationName = null;
    addFirmDetailStatus = json['add_firm_detail_status'];
    firmName = json['firm_name'];
    firmAddress = json['firm_address'];
    firmPhone = json['firm_phone'];
    firmPhone2 = json['firm_phone2'];
    firmEmail = json['firm_email'];
    firmLogo = null;
    executivePatronLifeMember = json['executive_patron_life_member'];
    nameOfTheMember = json['name_of_the_member'];
    nameOfSpouse = json['name_of_spouse'];
    contactNumber = json['contact_number'];
    dob = json['dob'];
    anyOtherInformation = json['any_other_information'];
    dateOfJoining = json['date_of_joining'];
    receiptNo = json['receipt_no'];
    marriageAnniversary = json['marriage_anniversary'];
    emailId = json['email_id'];
    presentAddress = json['present_address'];
    officeAddress = json['office_address'];
    permanentAddress = json['permanent_address'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    if (json['children_details'] != null) {
      childrenDetails = <ChildrenDetails>[];
      json['children_details'].forEach((v) {
        childrenDetails?.add(new ChildrenDetails.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['mc_id'] = mcId;
    _data['owner_id'] = ownerId;
    _data['designation'] = designation;
    _data['mc_joining_date'] = mcJoiningDate;
    _data['mc_ending_date'] = mcEndingDate;
    _data['mc_status'] = mcStatus;
    _data['added_date'] = addedDate;
    _data['mt_member_type'] = mtMemberType;
    _data['mc_name'] = mcName;
    _data['name'] = name;
    _data['email'] = email;
    _data['address'] = address;
    _data['image'] = image;
    _data['phone'] = phone;
    _data['profession'] = profession;
    _data['deals_in_id'] = dealsInId;
    _data['deals_in_name'] = dealsInName;
    _data['executive_member_designation'] = executiveMemberDesignation.map((e)=>e.toJson()).toList();
    _data['executive_member_status'] = executiveMemberStatus;
    _data['executive_member_designation_id'] = executiveMemberDesignationId;
    _data['executive_member_designation_name'] = executiveMemberDesignationName;
    _data['add_firm_detail_status'] = addFirmDetailStatus;
    _data['firm_name'] = firmName;
    _data['firm_address'] = firmAddress;
    _data['firm_phone'] = firmPhone;
    _data['firm_phone2'] = firmPhone2;
    _data['firm_email'] = firmEmail;
    _data['firm_logo'] = firmLogo;
    _data['executive_patron_life_member'] = executivePatronLifeMember;
    _data['name_of_the_member'] = nameOfTheMember;
    _data['name_of_spouse'] = nameOfSpouse;
    _data['contact_number'] = contactNumber;
    _data['dob'] = dob;
    _data['any_other_information'] = anyOtherInformation;
    _data['date_of_joining'] = dateOfJoining;
    _data['receipt_no'] = receiptNo;
    _data['marriage_anniversary'] = marriageAnniversary;
    _data['email_id'] = emailId;
    _data['present_address'] = presentAddress;
    _data['office_address'] = officeAddress;
    _data['permanent_address'] = permanentAddress;
    _data['father_name'] = fatherName;
    _data['mother_name'] = motherName;
    _data['children_details'] = childrenDetails;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class ExecutiveMemberDesignation {
  ExecutiveMemberDesignation({
    required this.id,
    required this.name,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String name;
  late final String order;
  late final String createdAt;
  late final String updatedAt;

  ExecutiveMemberDesignation.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    order = json['order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['order'] = order;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}