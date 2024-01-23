class ResData {
  ResData({
    required this.status,
    required this.msg,
  });
  late final int status;
  late final String msg;

  ResData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    return _data;
  }
}