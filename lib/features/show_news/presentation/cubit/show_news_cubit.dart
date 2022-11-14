import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/response/failures.dart';
import 'package:new_app/features/show_news/domain/usecases/fetch_news.dart';

import '../../../../core/services_locator.dart';
import '../../domain/entities/news_info.dart';

part 'show_news_state.dart';

class ShowNewsCubit extends Cubit<ShowNewsState> {
  ShowNewsCubit() : super(const ShowNewsInitial(news:  []));

  final FetchNewsUsecase _fetchNewsUsecase = sl<FetchNewsUsecase>();

  void fetchNews(String searchText) async {
    emit(ShowNewsLoading());
    final Either<Failure, List<NewsInfo>> fetchNewsResult =
        await _fetchNewsUsecase.fetchNews(searchText);
    fetchNewsResult.fold((l) => emit(ShowNewsError()), (news) {
      if (searchText.isNotEmpty) {
        emit(ShowNewsInitialSearch(news: news));
      } else {
        emit(ShowNewsInitial(news: news));
      }
    });
  }
}
