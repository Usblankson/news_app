import 'package:new_app/features/show_news/domain/entities/news_info.dart';

class NewsInfoModel extends NewsInfo {
  NewsInfoModel({
    String? title,
    String? author,
    String? imageURL,
    String? content,
    String? publishedAt,
  }) : super(
            title: title,
            author: author,
            imageURL: imageURL,
            content: content,
            publishedAt: _getDateTimeInDateTime(publishedAt));

  static DateTime _getDateTimeInDateTime(String? publishedAt) {
    if (publishedAt == null) {
      return DateTime.now();
    } else {
      final DateTime? dateTimeInDateTimeFormat = DateTime.tryParse(publishedAt);
      if (dateTimeInDateTimeFormat == null) {
        return DateTime.now();
      } else {
        return dateTimeInDateTimeFormat;
      }
    }
  }

  factory NewsInfoModel.fromMap(Map<String, dynamic> map) {
    return NewsInfoModel(
      title: map['title'],
      author: map['author'],
      imageURL: map['urlToImage'],
      content: map['content'],
      publishedAt: map['publishedAt'],
    );
  }
}
