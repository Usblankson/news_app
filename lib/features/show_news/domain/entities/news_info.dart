class NewsInfo{
  final String? title;
  final String? author;
  final String? imageURL;
  final String? content;
  final DateTime publishedAt;

  const NewsInfo({
    this.title,
    this.author,
    this.imageURL,
    this.content,
    required this.publishedAt,
  });
}