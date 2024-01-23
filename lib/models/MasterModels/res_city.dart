class ResCityData {
  ResCityData({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<Data> data;

  ResCityData.fromJson(Map<String, dynamic> json){
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
    required this.cityId,
    required this.cityName,
    required this.stateId,
    required this.countryId,
    required this.cDate,
    required this.status,
  });
  late final String cityId;
  late final String cityName;
  late final String stateId;
  late final String countryId;
  late final String cDate;
  late final String status;

  Data.fromJson(Map<String, dynamic> json){
    cityId = json['cityId'];
    cityName = json['cityName'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    cDate = json['cDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cityId'] = cityId;
    _data['cityName'] = cityName;
    _data['stateId'] = stateId;
    _data['countryId'] = countryId;
    _data['cDate'] = cDate;
    _data['status'] = status;
    return _data;
  }
}