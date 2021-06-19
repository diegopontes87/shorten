import 'package:equatable/equatable.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_entity/shorten_url_entity.dart';

class MediumButtonStateModel extends Equatable {
  ShortenUrlEntity? entity;
  bool isCopied;
  MediumButtonStateModel({this.isCopied = false, this.entity});

  @override
  List<Object?> get props => [entity?.shortLink];
}
