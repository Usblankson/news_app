import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:new_app/core/response/exceptions.dart';
import 'package:new_app/features/show_news/domain/entities/news_info.dart';
import 'package:new_app/features/show_news/domain/repositories/fetch_news_repo_contract.dart';

import '../../../../core/response/failures.dart';
import '../../../../core/services_locator.dart';
import '../datasources/fetch_from_remote_ds.dart';

class FetchNewsRepoImplementation implements FetchNewsRepoContract {
  final FetchFromRemoteDSContract fetchFromRemoteDSContract =
      sl<FetchFromRemoteDSContract>();

  @override
  Future<Either<Failure, List<NewsInfo>>> fetchNews(String? searchText) async {
    try {
      var right = Right(await fetchFromRemoteDSContract.fetchNews(searchText));
      log(right.toString(), name: "Right Data");
      return Right(await fetchFromRemoteDSContract.fetchNews(searchText));
    } on FetchException catch (e) {
        log(e.toString(), name: "Left Data");
      return Left(FetchFailure(message: e.message));
    }
  }
}
