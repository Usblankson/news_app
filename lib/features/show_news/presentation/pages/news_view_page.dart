import 'package:flutter/material.dart';
import 'package:new_app/core/constants/pallete.dart';

import '../../domain/entities/news_info.dart';

class NewsViewPage extends StatelessWidget {
  final NewsInfo newsInfo;
  const NewsViewPage({Key? key, required this.newsInfo}) : super(key: key);

  String getDateinDDMMYY(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background,
      appBar: AppBar(
        backgroundColor: Pallete.background,
        elevation: 0,
        leading: BackButton(
            color: Pallete.lightTextColor,
            onPressed: () => Navigator.pop(context)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                newsInfo.title ?? "** No Title **",
                style: const TextStyle(
                    color: Pallete.lightTextColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 300,
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Pallete.navyBlue,
                  image: DecorationImage(
                      image: NetworkImage(newsInfo.imageURL ??
                          'https://res.cloudinary.com/practicaldev/image/fetch/s--jLZl-rUj--/c_imagga_scale,f_auto,fl_progressive,h_420,q_auto,w_1000/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/xz9s4y9yyl6ilqzsluww.png'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Text('Date: ${getDateinDDMMYY(newsInfo.publishedAt)}',
                  style: const TextStyle(
                      color: Pallete.lightTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text('Author: ${newsInfo.author ?? "Unknown Author"}',
                    style: const TextStyle(
                        color: Pallete.lightTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ),
              Text(newsInfo.content ?? "** No Content **",
                  style: const TextStyle(
                      color: Pallete.lightTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
