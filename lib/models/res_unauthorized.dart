class ResUnauthorized {
  ResUnauthorized({
    required this.status,
    required this.code,
    required this.message,
  });
  late final String status;
  late final int code;
  late final String message;

  ResUnauthorized.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    return _data;
  }
}