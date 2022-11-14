part of 'show_news_cubit.dart';

abstract class ShowNewsState extends Equatable {
  const ShowNewsState();

  @override
  List<Object> get props => [];
}

class ShowNewsInitial extends ShowNewsState {
  final List<NewsInfo> news;
  const ShowNewsInitial({required this.news});
}

class ShowNewsInitialSearch extends ShowNewsState {
  final List<NewsInfo> news;
  const ShowNewsInitialSearch({required this.news});
}

class ShowNewsLoading extends ShowNewsState {}

class ShowNewsError extends ShowNewsState {}
