class Corp {
  String? personId;
  String? firstName;
  String? lastName;
  double? idNumber;
  String? gender;
  double? phoneNo;
  String? countyId;
  String? subCountyId;
  String? createdAt;
  String? updatedAt;
  Null? createdBy;
  Null? updatedBy;
  String? status;
  Null? level;
  Null? county;

  Corp(
      { this.personId,
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

  Corp.fromJson(Map<String, dynamic> json) {
    personId = json['person_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    idNumber = json['id_number'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    countyId = json['county_id'];
    subCountyId = json['sub_county_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    status = json['status'];
    level = json['level'];
    county = json['county'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['person_id'] = personId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['id_number'] = idNumber;
    data['gender'] = gender;
    data['phone_no'] = phoneNo;
    data['county_id'] = countyId;
    data['sub_county_id'] = subCountyId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    data['level'] = level;
    data['county'] = county;
    return data;
  }
}
