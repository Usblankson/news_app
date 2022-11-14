import 'package:new_app/core/constants/strings.dart';
import 'package:new_app/features/show_news/data/models/news_info_model.dart';

import '../../../../core/response/exceptions.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services_locator.dart';
import '../../domain/entities/news_info.dart';

abstract class FetchFromRemoteDSContract {
  Future<List<NewsInfo>> fetchNews(String? searchText);
}

class FetchFromRemoteDSImplementation implements FetchFromRemoteDSContract {
  final ApiService apiService = sl<ApiService>();

  @override
  Future<List<NewsInfo>> fetchNews(String? searchText) async {
    try {
      final Map<String, dynamic> data = await apiService.getData(
        searchText == ''
            ? "https://newsapi.org/v2/top-headlines"
            : "https://newsapi.org/v2/everything",
        {
          if (searchText != '') "q": searchText,
          "apiKey": Strings.newsApiKey,
        },
      );

      List list = data['articles'];
      List<Map<String, dynamic>> mapList = [];
      for (int i = 0; i < list.length; i++) {
        Map<String, dynamic> map = list[i] as Map<String, dynamic>;
        mapList.add(map);
      }

      List<NewsInfo> news = [];
      for (int i = 0; i < mapList.length; i++) {
        NewsInfo newsInfo = NewsInfoModel.fromMap(mapList[i]);
        news.add(newsInfo);
      }

      return news;
    } catch (e) {
      throw FetchException(message: "Failed to fetch data");
    }
  }
}
