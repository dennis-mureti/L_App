import 'dart:convert';

class SubCounties {
  String? name;
  String? timeStamp;
  String? status;
  String? countyId;
  String? id;

  SubCounties({this.name, this.timeStamp, this.status, this.countyId, this.id});

  SubCounties.fromMap(Map<String, dynamic> json) {
    name = json['name'];
    timeStamp = json['time_stamp'];
    status = json['status'];
    countyId = json['county_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['time_stamp'] = timeStamp;
    data['status'] = status;
    data['county_id'] = countyId;
    data['id'] = id;
    return data;
  }

  factory SubCounties.fromJson(String source) =>
      SubCounties.fromMap(json.decode(source));
}
