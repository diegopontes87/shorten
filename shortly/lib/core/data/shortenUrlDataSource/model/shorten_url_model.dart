
import 'package:shortly/core/data/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';

class ShortenUrlModel {
  String? code;
  String? shortLink;
  String? originalLink;

  ShortenUrlModel({
    this.code,
    this.shortLink,
    this.originalLink,
  });

  ShortenUrlModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    shortLink = json['short_link'];
    originalLink = json['original_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['short_link'] = this.shortLink;
    data['original_link'] = this.originalLink;
    return data;
  }
}

extension Mapper on ShortenUrlModel {
  ShortenUrlEntity toEntity() {
    return ShortenUrlEntity(
      code: this.code,
      shortLink: this.shortLink,
      originalLink: this.originalLink,
    );
  }
}
