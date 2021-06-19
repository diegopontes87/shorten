import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';

import 'shorten_url_model.dart';

class ShortenUrlResultModel {
  ShortenUrlModel? result;

  ShortenUrlResultModel(this.result);

  ShortenUrlResultModel.fromJson(Map<String, dynamic> json) {
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

extension Mapper on ShortenUrlModel {
  ShortenUrlEntity toEntity() {
    return ShortenUrlEntity(
      id: this.id,
      code: this.code,
      shortLink: this.shortLink,
      originalLink: this.originalLink,
    );
  }
}
