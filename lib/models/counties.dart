import 'dart:convert';

class Counties {
  String? id;
  String? name;
  double? code;
  String? status;

  Counties({this.id, this.name, this.code, this.status, p});

  Counties.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'status': status,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['status'] = status;

    return data;
  }

  // String toJson() => json.encode(toMap());

  factory Counties.fromJson(String source) =>
      Counties.fromMap(json.decode(source));
}
