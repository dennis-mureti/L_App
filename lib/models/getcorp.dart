import 'dart:convert';

class GetCorp {
  String? personId;
  String? firstName;
  String? lastName;
  String? idNumber;
  String? gender;
  String? phoneNo;
  String? countyId;
  String? subCountyId;
  String? createdAt;
  String? updatedAt;
  Null? createdBy;
  Null? updatedBy;
  String? status;
  Null? level;
  Null? county;

  GetCorp(
      {this.personId,
      this.firstName,
      this.lastName,
      this.idNumber,
      this.gender,
      this.phoneNo,
      this.countyId,
      this.subCountyId,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.level,
      this.county});

  GetCorp.fromMap(Map<String, dynamic> map) {
    personId = map['person_id'];
    firstName = map['first_name'];
    lastName = map['last_name'];
    idNumber = map['id_number'];
    gender = map['gender'];
    phoneNo = map['phone_no'];
    countyId = map['county_id'];
    subCountyId = map['sub_county_id'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    createdBy = map['created_by'];
    updatedBy = map['updated_by'];
    status = map['status'];
    level = map['level'];
    county = map['county'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = this.personId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['id_number'] = this.idNumber;
    data['gender'] = this.gender;
    data['phone_no'] = this.phoneNo;
    data['county_id'] = this.countyId;
    data['sub_county_id'] = this.subCountyId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['status'] = this.status;
    data['level'] = this.level;
    data['county'] = this.county;
    return data;
  }

  factory GetCorp.fromJson(String source) =>
      GetCorp.fromMap(json.decode(source));
}
