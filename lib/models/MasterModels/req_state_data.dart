class ReqStateData {
  ReqStateData({
    required this.countryId,
  });
  late final int countryId;

  ReqStateData.fromJson(Map<String, dynamic> json){
    countryId = json['country_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['country_id'] = countryId;
    return _data;
  }
}