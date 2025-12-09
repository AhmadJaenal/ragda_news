import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
abstract class NewsModel with _$NewsModel {
  const factory NewsModel({
    required NewsSourceModel source,
    String? author,
    required String title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  static List<NewsModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((news) => NewsModel.fromJson(news)).toList();
}

@freezed
abstract class NewsSourceModel with _$NewsSourceModel {
  const factory NewsSourceModel({String? id, required String name}) =
      _NewsSourceModel;

  factory NewsSourceModel.fromJson(Map<String, dynamic> json) =>
      _$NewsSourceModelFromJson(json);
}
