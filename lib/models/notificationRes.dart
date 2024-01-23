class NotificationRes {
  NotificationRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Data> data;

  NotificationRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.insertDate,
    required this.memberid,
    required this.status,
    required this.statusDelete,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String type;
  late final String insertDate;
  late final String memberid;
  late final String status;
  late final String statusDelete;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    insertDate = json['insertDate'];
    memberid = json['memberid'];
    status = json['status'];
    statusDelete = json['status_delete'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['type'] = type;
    _data['insertDate'] = insertDate;
    _data['memberid'] = memberid;
    _data['status'] = status;
    _data['status_delete'] = statusDelete;
    return _data;
  }
}