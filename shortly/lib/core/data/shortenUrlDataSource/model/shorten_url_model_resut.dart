import 'shorten_url_model.dart';

class ShortenUrlModelResult {
  ShortenUrlModel? result;

  ShortenUrlModelResult(this.result);

  ShortenUrlModelResult.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? new ShortenUrlModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result?.toJson();
    }
    return data;
  }
}
