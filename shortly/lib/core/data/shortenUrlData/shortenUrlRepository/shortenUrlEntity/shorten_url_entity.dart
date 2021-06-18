import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/model/shorten_url_model.dart';

class ShortenUrlEntity {
  int? id;
  String? code;
  String? shortLink;
  String? originalLink;

  ShortenUrlEntity({
    this.id,
    this.code,
    this.shortLink,
    this.originalLink,
  });
}

extension Mapper on ShortenUrlEntity {
  ShortenUrlModel toModel() {
    return ShortenUrlModel(
      id: this.id,
      code: this.code,
      shortLink: this.shortLink,
      originalLink: this.originalLink,
    );
  }
}
