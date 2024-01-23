class AdsData {
  int? status;
  String? msg;
  List<Ads>? ads;

  AdsData({this.status, this.msg, this.ads});

  AdsData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['ads'] != null) {
      ads = <Ads>[];
      json['ads'].forEach((v) {
        ads?.add(new Ads.fromJson(v));
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
    return data;
  }
}

class Ads {
  String? id;
  String? memberId;
  String? title;
  String? imageUrl;
  String? period;
  String? rate;
  String? status;
  String? insertDate;
  String? updateDate;
  String? bigImage;
  String? t;

  Ads(
      {this.id,
        this.memberId,
        this.title,
        this.imageUrl,
        this.period,
        this.rate,
        this.status,
        this.insertDate,
        this.updateDate,
        this.bigImage,
        this.t});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['memberId'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    period = json['period'];
    rate = json['rate'];
    status = json['status'];
    insertDate = json['insert_date'];
    updateDate = json['update_date'];
    bigImage = json['big_image'];
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['memberId'] = this.memberId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['period'] = this.period;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['insert_date'] = this.insertDate;
    data['update_date'] = this.updateDate;
    data['big_image'] = this.bigImage;
    data['t'] = this.t;
    return data;
  }
}
