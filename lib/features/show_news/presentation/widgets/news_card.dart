import 'package:flutter/material.dart';
import 'package:new_app/core/constants/pallete.dart';
import 'package:new_app/features/show_news/domain/entities/news_info.dart';

import '../pages/news_view_page.dart';

class NewsCard extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsCard({Key? key, required this.newsInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) =>  NewsViewPage(newsInfo: newsInfo,))),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 260,
              decoration: BoxDecoration(
                color: Pallete.navyBlue,
                image: newsInfo.imageURL != null
                    ? DecorationImage(
                        image: NetworkImage(newsInfo.imageURL!),
                        fit: BoxFit.cover)
                    : null,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Positioned(
              right: 16,
              left: 16,
              bottom: 0,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Pallete.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Pallete.grey,
                      offset: Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: Text(
                    newsInfo.title != null ? newsInfo.title! : '** No Title **',
                    maxLines: 2,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Pallete.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
