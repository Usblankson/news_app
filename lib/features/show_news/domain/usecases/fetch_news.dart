import 'package:dartz/dartz.dart';
import 'package:new_app/features/show_news/domain/entities/news_info.dart';
import 'package:new_app/features/show_news/domain/repositories/fetch_news_repo_contract.dart';

import '../../../../core/response/failures.dart';
import '../../../../core/services_locator.dart';

class FetchNewsUsecase {
   final FetchNewsRepoContract repository = sl<FetchNewsRepoContract>();


  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
 return repository.fetchNews(searchText);
  }
}