import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/pallete.dart';

import '../cubit/show_news_cubit.dart';
import '../widgets/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  refreshPage() {
    context.read<ShowNewsCubit>().fetchNews('');
  }

  @override
  void initState() {
    refreshPage();
    super.initState();
  }

  String? searchText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Pallete.background,
        appBar: AppBar(
          backgroundColor: Pallete.background,
          elevation: 0,
          title: const Text(
            'News',
            style: TextStyle(
              color: Pallete.lightTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (value) async {
                  searchText = value;
                  if (searchText!.isEmpty) {
                    context.read<ShowNewsCubit>().fetchNews('');
                  } else {
                    context.read<ShowNewsCubit>().fetchNews(searchText!);
                  }
                },
                cursorColor: Pallete.lightTextColor,
                style: const TextStyle(
                    color: Pallete.lightTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Pallete.lightTextColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Pallete.lightTextColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Pallete.lightTextColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Pallete.lightTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ShowNewsCubit, ShowNewsState>(
                builder: (context, state) {
                  if (state is ShowNewsInitialSearch) {
                    return const Text(
                      'Searched News',
                      style: TextStyle(
                          color: Pallete.lightTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    );
                  } else if (state is ShowNewsInitial) {
                    return const Text(
                      'Top News',
                      style: TextStyle(
                          color: Pallete.lightTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<ShowNewsCubit, ShowNewsState>(
                  builder: (context, state) {
                    if (state is ShowNewsLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Pallete.lightTextColor,
                        ),
                      );
                    } else if (state is ShowNewsInitial) {
                      return ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            newsInfo: state.news[index],
                          );
                        },
                      );
                    } else if (state is ShowNewsInitialSearch) {
                      return ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          return NewsCard(
                            newsInfo: state.news[index],
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            const Text(
                              'Error occured',
                              style: TextStyle(
                                  color: Pallete.lightTextColor, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            IconButton(
                              onPressed: refreshPage,
                              icon: const Icon(
                                Icons.replay_outlined,
                                color: Pallete.lightColor,
                                size: 24,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
