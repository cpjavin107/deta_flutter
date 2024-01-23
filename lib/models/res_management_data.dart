class ResManagementData {
  ResManagementData({
    required this.status,
    required this.msg,
    required this.ads,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Ads> ads;
  late final List<Data> data;

  ResManagementData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    ads = List.from(json['ads']).map((e)=>Ads.fromJson(e)).toList();
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['ads'] = ads.map((e)=>e.toJson()).toList();
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
    this.rate,
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
  late final Null rate;
  late final String status;
  late final String insertDate;
  late final String updateDate;
  late final String bigImage;
  late final String smallImage;

  Ads.fromJson(Map<String, dynamic> json){
    id = json['id'];
    memberId = json['memberId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    imageUrlSmall = json['imageUrlSmall'];
    period = json['period'];
    rate = null;
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
    required this.image,
    required this.designationName,
    required this.mcId,
    required this.priority,
    required this.memberId,
    required this.mcJoiningDate,
    required this.mcEndingDate,
    required this.addedDate,
    required this.mcName,
    required this.address,
    required this.mobileNumber,
    required this.officeNumber,
    required this.email,
    required this.type,
    required this.dealsIn_1,
    required this.dealsIn_2,
    required this.residence,
    required this.firmName,
    required this.typeName,
  });
  late final String image;
  late final String designationName;
  late final String mcId;
  late final String priority;
  late final String memberId;
  late final String mcJoiningDate;
  late final String mcEndingDate;
  late final String addedDate;
  late final String mcName;
  late final String address;
  late final String mobileNumber;
  late final String officeNumber;
  late final String email;
  late final String type;
  late final String dealsIn_1;
  late final String dealsIn_2;
  late final String residence;
  late final String firmName;
  late final String typeName;

  Data.fromJson(Map<String, dynamic> json){
    image = json['image']??"";
    designationName = json['designationName']??"";
    mcId = json['mc_id']??"";
    priority = json['priority']??"";
    memberId = json['memberId']??"";
    mcJoiningDate = json['mc_joining_date']??"";
    mcEndingDate = json['mc_ending_date']??"";
    addedDate = json['added_date']??"";
    mcName = json['mc_name']??"";
    address = json['address']??"";
    mobileNumber = json['mobileNumber']??"";
    officeNumber = json['officeNumber']??"";
    email = json['email']??"";
    type = json['type']??"";
    dealsIn_1 = json['deals_in_1']??"";
    dealsIn_2 = json['deals_in_2']??"";
    residence = json['residence']??"";
    firmName = json['firm_name']??"";
    typeName = json['type_name']??"";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['designationName'] = designationName;
    _data['mc_id'] = mcId;
    _data['priority'] = priority;
    _data['memberId'] = memberId;
    _data['mc_joining_date'] = mcJoiningDate;
    _data['mc_ending_date'] = mcEndingDate;
    _data['added_date'] = addedDate;
    _data['mc_name'] = mcName;
    _data['address'] = address;
    _data['mobileNumber'] = mobileNumber;
    _data['officeNumber'] = officeNumber;
    _data['email'] = email;
    _data['type'] = type;
    _data['deals_in_1'] = dealsIn_1;
    _data['deals_in_2'] = dealsIn_2;
    _data['residence'] = residence;
    _data['firm_name'] = firmName;
    _data['type_name'] = typeName;
    return _data;
  }
}