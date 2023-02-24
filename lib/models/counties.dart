import 'dart:convert';

class Counties {
  String? id;
  String? name;
  double? code;
  String? status;

  Counties(
      {required this.id,
      required this.name,
      required this.code,
      required this.status,
      p});

  Counties.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    code = map['code'];
    status = map['status'];
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

