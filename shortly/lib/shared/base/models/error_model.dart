import 'package:shortly/shared/base/entity/error_entity.dart';

class ErrorModel {
  bool? ok;
  int? errorCode;
  String? error;

  ErrorModel({this.ok, this.errorCode, this.error});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    errorCode = json['error_code'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    data['error_code'] = this.errorCode;
    data['error'] = this.error;
    return data;
  }
}

extension Mapper on ErrorModel{
  ErrorEntity toEntity(){
    return ErrorEntity(
      ok:this.ok,
      error: this.error,
      errorCode: this.errorCode
    );
  }
}