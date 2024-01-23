class ContactModel {
  int? status;
  String? msg;
  List<Ads>? ads;
  List<Data>? data;

  ContactModel({this.status, this.msg, this.ads, this.data});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads?.add(new Ads.fromJson(v));
      });
    }
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.ads != null) {
      data['ads'] = this.ads?.map((v) => v.toJson()).toList();
    }
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Ads {
  String? id;
  String? memberId;
  String? title;
  String? imageUrl;
  String? imageUrlSmall;
  String? period;
  String? rate;
  String? status;
  String? insertDate;
  String? updateDate;
  String? bigImage;
  String? smallImage;
  String? t;

  Ads(
      {this.id,
        this.memberId,
        this.title,
        this.imageUrl,
        this.imageUrlSmall,
        this.period,
        this.rate,
        this.status,
        this.insertDate,
        this.updateDate,
        this.bigImage,
        this.smallImage,
        this.t});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    imageUrlSmall = json['imageUrlSmall'];
    period = json['period'];
    rate = json['rate']??"";
    status = json['status'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
    bigImage = json['big_image'];
    smallImage = json['small_image'];
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['memberId'] = this.memberId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['imageUrlSmall'] = this.imageUrlSmall;
    data['period'] = this.period;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['insert_date'] = this.insertDate;
    data['update_date'] = this.updateDate;
    data['big_image'] = this.bigImage;
    data['small_image'] = this.smallImage;
    data['t'] = this.t;
    return data;
  }
}

class Data {
  String? informationId;
  String? usefullId;
  String? address;
  String? contactNumber;
  String? status;
  String? insertDate;
  String? updateDate;

  Data(
      {this.informationId,
        this.usefullId,
        this.address,
        this.contactNumber,
        this.status,
        this.insertDate,
        this.updateDate});

  Data.fromJson(Map<String, dynamic> json) {
    informationId = json['informationId'];
    usefullId = json['usefullId'];
    address = json['address'];
    contactNumber = json['contactNumber'];
    status = json['status'];
    insertDate = json['insertDate'];
    updateDate = json['updateDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['informationId'] = this.informationId;
    data['usefullId'] = this.usefullId;
    data['address'] = this.address;
    data['contactNumber'] = this.contactNumber;
    data['status'] = this.status;
    data['insertDate'] = this.insertDate;
    data['updateDate'] = this.updateDate;
    return data;
  }
}
