class NewsModel {
  int? status;
  String? msg;
  List<Ads>? ads;
  List<Data>? data;

  NewsModel({this.status, this.msg, this.ads, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
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
  Null rate;
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
    rate = json['rate'];
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
  String? id;
  String? title;
  String? date;
  String? time;
  String? description;
  String? type;
  List<Images>? images;

  Data(
      {this.id,
        this.title,
        this.date,
        this.time,
        this.description,
        this.type,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    time = json['time'];
    description = json['description'];
    type = json['type'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images?.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['date'] = this.date;
    data['time'] = this.time;
    data['description'] = this.description;
    data['type'] = this.type;
    if (this.images != null) {
      data['images'] = this.images?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? id;
  String? eventId;
  String? type;
  String? image;
  String? fileType;

  Images({this.id, this.eventId, this.type, this.image, this.fileType});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    type = json['type'];
    image = json['image'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_id'] = this.eventId;
    data['type'] = this.type;
    data['image'] = this.image;
    data['file_type'] = this.fileType;
    return data;
  }
}
