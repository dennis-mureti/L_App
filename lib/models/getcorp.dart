import 'dart:convert';

class GetCorp {
  String? corpId;
  String? personId;
  String? isVet;
  double? vetRegNumber;
  String? vetRegStatus;
  String? createdAt;
  String? updatedAt;
  Null? createdBy;
  Null? updatedBy;

  GetCorp({
    this.corpId,
    this.personId,
    this.isVet,
    this.vetRegNumber,
    this.vetRegStatus,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
  });

  GetCorp.fromMap(Map<String, dynamic> map) {
    corpId = map['corp_id'];
    personId = map['person_id'];
    isVet = map['is_vet'];
    vetRegNumber = map['vet_reg_number'];
    vetRegStatus = map['vet_reg_status'];
    createdAt = map['created_at'];
    updatedAt = map['updated_at'];
    createdBy = map['created_by'];
    updatedBy = map['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['corp_id'] = this.corpId;
    data['person_id'] = this.personId;
    data['is_vet'] = this.isVet;
    data['vet_reg_number'] = this.vetRegNumber;
    data['vet_reg_status'] = this.vetRegStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }

  // String toJson() => json.encode(toMap());

  factory GetCorp.fromJson(String source) =>
      GetCorp.fromMap(json.decode(source));
}
