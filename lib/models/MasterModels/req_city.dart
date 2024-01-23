class ReqCityData {
  ReqCityData({
    required this.stateId,
  });
  late final String stateId;

  ReqCityData.fromJson(Map<String, dynamic> json){
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state_id'] = stateId;
    return _data;
  }
}