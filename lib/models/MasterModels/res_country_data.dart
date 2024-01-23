class ResCountryData {
  bool? success;
  List<Country>? data;
  String? message;

  ResCountryData({this.success, this.data, this.message});

  ResCountryData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Country>[];
      json['data'].forEach((v) {
        data!.add(new Country.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Country {
  int? countryId;
  String? countryName;
  String? cDate;
  String? status;

  Country({this.countryId, this.countryName, this.cDate, this.status});

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    countryName = json['countryName'];
    cDate = json['cDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['countryName'] = this.countryName;
    data['cDate'] = this.cDate;
    data['status'] = this.status;
    return data;
  }
}