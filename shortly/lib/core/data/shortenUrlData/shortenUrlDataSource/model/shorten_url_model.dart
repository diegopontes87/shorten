import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';

class ShortenUrlModel {
  int? id;

  String? code;
  String? shortLink;
  String? originalLink;

  ShortenUrlModel({
    this.id,
    this.code,
    this.shortLink,
    this.originalLink,
  });

  ShortenUrlModel.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    code = json['code'];
    shortLink = json['short_link'];
    originalLink = json['original_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['short_link'] = this.shortLink;
    data['original_link'] = this.originalLink;
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
