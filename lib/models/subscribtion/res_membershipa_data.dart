class ResMembershipaData {
  ResMembershipaData({
    required this.status,
    required this.msg,
    required this.ads,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<dynamic> ads;
  late final List<Data> data;

  ResMembershipaData.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.description,
    required this.duration,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.payment,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String duration;
  late final String price;
  late final String startDate;
  late final String endDate;
  late final String status;
  late final List<Payment> payment;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    price = json['price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    payment = List.from(json['payment']).map((e)=>Payment.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['duration'] = duration;
    _data['price'] = price;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['status'] = status;
    _data['payment'] = payment.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Payment {
  Payment({
    required this.id,
    required this.membershipId,
    required this.name,
    required this.phone,
    required this.transactionId,
    required this.userId,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String membershipId;
  late final String name;
  late final String phone;
  late final String transactionId;
  late final String userId;
  late final String image;
  late final String startDate;
  late final String endDate;
  late final String status;
  late final String createdAt;
  late final String updatedAt;

  Payment.fromJson(Map<String, dynamic> json){
    id = json['id'];
    membershipId = json['membership_id'];
    name = json['name'];
    phone = json['phone'];
    transactionId = json['transaction_id'];
    userId = json['user_id'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['membership_id'] = membershipId;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['transaction_id'] = transactionId;
    _data['user_id'] = userId;
    _data['image'] = image;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}