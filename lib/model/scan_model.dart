class ScanModel {
  ScanModel({
    required this.status,
    required this.massage,
    required this.data,
  });
  late final int status;
  late final String massage;
  late final Data data;

  ScanModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    massage = json['massage'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['massage'] = massage;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.code,
    required this.scannerId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String code;
  late final int scannerId;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Data.fromJson(Map<String, dynamic> json){
    code = json['code'];
    scannerId = json['scanner_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['scanner_id'] = scannerId;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}