class EnquiryModel {
  int? status;
  String? msg;
  List<Null>? ads;
  List<Data>? data;

  EnquiryModel({this.status, this.msg, this.ads, this.data});

  EnquiryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    // if (json['ads'] != null) {
    //   ads = <Null>[];
    //   json['ads'].forEach((v) {
    //     ads!.add(new Null.fromJson(v));
    //   });
    // }
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
    // if (this.ads != null) {
    //   data['ads'] = this.ads!.map((v) => v.toJson()).toList();
    // }
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? name;
  String? mobile;
  String? description;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.name,
        this.mobile,
        this.description,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    name = json['name'];
    mobile = json['mobile'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
