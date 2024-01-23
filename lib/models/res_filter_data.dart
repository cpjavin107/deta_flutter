class ResFilterData {
  ResFilterData({
    required this.status,
    required this.msg,
    required this.ads,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Ads> ads;
  late final List<Data> data;

  ResFilterData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    ads = List.from(json['ads']).map((e)=>Ads.fromJson(e)).toList();
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['ads'] = ads.map((e)=>e?.toJson()).toList();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Ads {
  Ads({
    required this.id,
    required this.memberId,
    required this.title,
    required this.imageUrl,
    required this.imageUrlSmall,
    required this.period,
    required this.rate,
    required this.status,
    required this.insertDate,
    required this.updateDate,
    required this.bigImage,
    required this.smallImage,
  });
  late final String id;
  late final String memberId;
  late final String title;
  late final String imageUrl;
  late final String imageUrlSmall;
  late final String period;
  late final String rate;
  late final String status;
  late final String insertDate;
  late final String updateDate;
  late final String bigImage;
  late final String smallImage;

  Ads.fromJson(Map<String, dynamic> json){
    id = json['id'];
    memberId = json['memberId']??"";
    title = json['title']??"";
    imageUrl = json['imageUrl']??"";
    imageUrlSmall = json['imageUrlSmall']??"";
    period = json['period']??"";
    rate = json['rate']??"";
    status = json['status'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
    bigImage = json['big_image'];
    smallImage = json['small_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['memberId'] = memberId;
    _data['title'] = title;
    _data['imageUrl'] = imageUrl;
    _data['imageUrlSmall'] = imageUrlSmall;
    _data['period'] = period;
    _data['rate'] = rate;
    _data['status'] = status;
    _data['insert_date'] = insertDate;
    _data['update_date'] = updateDate;
    _data['big_image'] = bigImage;
    _data['small_image'] = smallImage;
    return _data;
  }
}

class Data {
  Data({
    required this.memberId,
    required this.name,
    this.password,
    required this.firmNo,
    required this.mobileNumber,
    this.landlineNumber,
    this.officeContactNumber,
    this.officeNumber,
    required this.email,
    this.address,
    required this.imageUrl,
    required this.type,
    this.dealsIn_1,
    this.dealsIn_2,
    this.dealsIn_3,
    this.dealsIn_4,
    required this.dob,
    required this.fatherName,
    required this.designation,
    required this.blood,
    required this.status,
    this.showStatus,
    required this.insertDate,
    required this.updateDate,
    this.residence,
    this.deviceToken,
    this.deviceId,
    this.website,
    this.ownerId,
    this.temple,
    this.planType,
    this.mobileNumber2,
    this.officeNumber2,
    this.gstNumber,
    this.residence2,
    this.firmName,
    this.signatureStatus,
    this.signature,
    this.price,
  });
  late final String memberId;
  late final String name;
  late final String? password;
  late final String firmNo;
  late final String mobileNumber;
  late final String? landlineNumber;
  late final String? officeContactNumber;
  late final String? officeNumber;
  late final String email;
  late final String? address;
  late final String imageUrl;
  late final String type;
  late final String? dealsIn_1;
  late final String? dealsIn_2;
  late final String? dealsIn_3;
  late final String? dealsIn_4;
  late final String dob;
  late final String fatherName;
  late final String designation;
  late final String blood;
  late final String status;
  late final String? showStatus;
  late final String insertDate;
  late final String updateDate;
  late final String? residence;
  late final String? deviceToken;
  late final String? deviceId;
  late final String? website;
  late final String? ownerId;
  late final String? temple;
  late final String? planType;
  late final String? mobileNumber2;
  late final String? officeNumber2;
  late final String? gstNumber;
  late final String? residence2;
  late final String? firmName;
  late final String? signatureStatus;
  late final String? signature;
  late final String? price;

  Data.fromJson(Map<String, dynamic> json){
    memberId = json['memberId']??"";
    name = json['name']??"";
    password = json['password']??"";
    firmNo = json['firm_no']??"";
    mobileNumber = json['mobileNumber']??"";
    landlineNumber = json['landlineNumber']??"";
    officeContactNumber = json['officeContactNumber']??"";
    officeNumber = json['officeNumber']??"";
    email = json['email']??"";
    address = json['address']??"";
    imageUrl = json['imageUrl']??"";
    type = json['type']??"";
    dealsIn_1 = json['dealsIn_1']??"";
    dealsIn_2 = json['dealsIn_2']??"";
    dealsIn_3 = json['dealsIn_3']??"";
    dealsIn_4 = json['dealsIn_4']??"";
    dob = json['dob']??"";
    fatherName = json['father_name']??"";
    designation = json['designation']??"";
    blood = json['blood']??"";
    status = json['status']??"";
    showStatus = json['showStatus']??"";
    insertDate = json['insertDate']??"";
    updateDate = json['updateDate']??"";
    residence = json['residence']??"";
    deviceToken = json['deviceToken']??"";
    deviceId = json['deviceId']??"";
    website = json['website']??"";
    ownerId = json['ownerId']??"";
    temple = json['temple']??"";
    planType = json['planType']??"";
    mobileNumber2 = json['mobileNumber2']??"";
    officeNumber2 = json['officeNumber2']??"";
    gstNumber = json['gstNumber']??"";
    residence2 = json['residence2']??"";
    firmName = json['firm_name']??"";
    signatureStatus = json['signatureStatus']??"";
    signature = json['signature']??"";
    price = json['price']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['memberId'] = memberId;
    _data['name'] = name;
    _data['password'] = password;
    _data['firm_no'] = firmNo;
    _data['mobileNumber'] = mobileNumber;
    _data['landlineNumber'] = landlineNumber;
    _data['officeContactNumber'] = officeContactNumber;
    _data['officeNumber'] = officeNumber;
    _data['email'] = email;
    _data['address'] = address;
    _data['imageUrl'] = imageUrl;
    _data['type'] = type;
    _data['deals_in_1'] = dealsIn_1;
    _data['deals_in_2'] = dealsIn_2;
    _data['deals_in_3'] = dealsIn_3;
    _data['deals_in_4'] = dealsIn_4;
    _data['dob'] = dob;
    _data['father_name'] = fatherName;
    _data['designation'] = designation;
    _data['blood'] = blood;
    _data['status'] = status;
    _data['show_status'] = showStatus;
    _data['insertDate'] = insertDate;
    _data['updateDate'] = updateDate;
    _data['residence'] = residence;
    _data['deviceToken'] = deviceToken;
    _data['deviceId'] = deviceId;
    _data['website'] = website;
    _data['ownerId'] = ownerId;
    _data['temple'] = temple;
    _data['planType'] = planType;
    _data['mobileNumber2'] = mobileNumber2;
    _data['officeNumber2'] = officeNumber2;
    _data['gstNumber'] = gstNumber;
    _data['residence2'] = residence2;
    _data['firm_name'] = firmName;
    _data['signature_status'] = signatureStatus;
    _data['signature'] = signature;
    _data['price'] = price;
    return _data;
  }
}