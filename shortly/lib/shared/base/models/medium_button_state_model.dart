import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shortenUrlEntity/shorten_url_entity.dart';

class MediumButtonStateModel {
  ShortenUrlEntity? entity;
  bool isCopied;
  MediumButtonStateModel({this.isCopied = false, this.entity});
}
