class ReqSubscribsion {
  ReqSubscribsion({
    required this.userId,
    required this.name,
    required this.phone,
    required this.transactionId,
    required this.image,
  });
  late final String userId;
  late final String name;
  late final String phone;
  late final String transactionId;
  late final String image;

  ReqSubscribsion.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    name = json['name'];
    phone = json['phone'];
    transactionId = json['transaction_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['transaction_id'] = transactionId;
    _data['image'] = image;
    return _data;
  }
}