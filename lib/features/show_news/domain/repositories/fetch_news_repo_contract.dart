import 'package:dartz/dartz.dart';

import '../../../../core/response/failures.dart';
import '../entities/news_info.dart';

abstract class FetchNewsRepoContract {
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText);
}