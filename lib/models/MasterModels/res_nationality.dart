class ResNationalityData {
  ResNationalityData({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Data> data;

  ResNationalityData.fromJson(Map<String, dynamic> json){
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
    required this.numCode,
    required this.alpha_2Code,
    required this.alpha_3Code,
    required this.enShortName,
    required this.nationality,
  });
  late final String numCode;
  late final String alpha_2Code;
  late final String alpha_3Code;
  late final String enShortName;
  late final String nationality;

  Data.fromJson(Map<String, dynamic> json){
    numCode = json['num_code'];
    alpha_2Code = json['alpha_2_code'];
    alpha_3Code = json['alpha_3_code'];
    enShortName = json['en_short_name'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['num_code'] = numCode;
    _data['alpha_2_code'] = alpha_2Code;
    _data['alpha_3_code'] = alpha_3Code;
    _data['en_short_name'] = enShortName;
    _data['nationality'] = nationality;
    return _data;
  }
}