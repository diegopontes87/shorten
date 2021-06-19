import 'package:shortly/core/data/shorten_url_data/shorten_url_datasource/model/shorten_url_model.dart';

class ShortenUrlListModel {
  List<ShortenUrlModel>? shortenUrlModelList;

  ShortenUrlListModel({this.shortenUrlModelList});

  ShortenUrlListModel.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      shortenUrlModelList = [];
      json['list'].forEach((v) {
        shortenUrlModelList?.add(new ShortenUrlModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shortenUrlModelList != null) {
      data['list'] = this.shortenUrlModelList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
