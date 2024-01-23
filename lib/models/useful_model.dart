class UsefulModel {
  int? status;
  String? msg;
  List<Data>? data;

  UsefulModel({this.status, this.msg, this.data});

  UsefulModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
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
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? uName;
  String? status;
  String? cDate;

  Data({this.id, this.uName, this.status, this.cDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uName = json['uName'];
    status = json['status'];
    cDate = json['cDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uName'] = this.uName;
    data['status'] = this.status;
    data['cDate'] = this.cDate;
    return data;
  }
}
