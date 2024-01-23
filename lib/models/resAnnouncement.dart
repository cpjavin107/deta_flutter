class ResAnnouncement {
  ResAnnouncement({
    required this.status,
    required this.msg,
    required this.ads,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Ads> ads;
  late final List<Data> data;

  ResAnnouncement.fromJson(Map<String, dynamic> json){
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
    required this.t,
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
  late final String t;

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
    t = json['t'];
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
    _data['t'] = t;
    return _data;
  }
}

class Data {
  Data({
    this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.description,
    required this.type,
    required this.images,
  });
  late final Null id;
  late final String title;
  late final String date;
  late final String time;
  late final String description;
  late final String type;
  late final List<dynamic> images;

  Data.fromJson(Map<String, dynamic> json){
    id = null;
    title = json['title'];
    date = json['date'];
    time = json['time'];
    description = json['description'];
    type = json['type'];
    images = List.castFrom<dynamic, dynamic>(json['images']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['date'] = date;
    _data['time'] = time;
    _data['description'] = description;
    _data['type'] = type;
    _data['images'] = images;
    return _data;
  }
}