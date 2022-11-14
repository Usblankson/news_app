import 'package:get_it/get_it.dart';
import 'package:new_app/core/services/api_service.dart';
import 'package:new_app/features/show_news/domain/usecases/fetch_news.dart';

import '../features/show_news/data/datasources/fetch_from_remote_ds.dart';
import '../features/show_news/data/repositories/fetch_news_repo_implementation.dart';
import '../features/show_news/domain/repositories/fetch_news_repo_contract.dart';

final GetIt sl = GetIt.instance;

void setupServices() {
  sl.registerSingleton<ApiService>(const ApiServiceImplementation());
  sl.registerSingleton<FetchFromRemoteDSContract>(
      FetchFromRemoteDSImplementation());
  sl.registerSingleton<FetchNewsRepoContract>(FetchNewsRepoImplementation());
  sl.registerSingleton<FetchNewsUsecase>(FetchNewsUsecase());
}
