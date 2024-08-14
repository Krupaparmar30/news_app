
class NewsFirstModal {
  final List<Articles> articles;

  NewsFirstModal({required this.articles});

  factory NewsFirstModal.fromApi(Map<String, dynamic> json) {
    return NewsFirstModal(
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Articles.fromApi(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Articles {
  final Source source;
  late String author;
  late String title;
  late String description;
  late String publishedAt;
  late String content;
  late String urlToImage;
  // late String url;

  Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.content,
    required this.urlToImage,
    // required this.url
  });

  factory Articles.fromApi(Map json) {
    return Articles(
      source: Source.fromApi(json['source'] as Map<String, dynamic>),
      author: json['author'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
      urlToImage: json['urlToImage'] ?? "https://www.presse-citron.net/app/uploads/2024/07/bangyu-wang-omoCm0bvNW4-unsplash-1-1.jpg"
        // ,url: json['url'] ?? ''
    );
  }
}

class Source {
  late String name;

  Source({required this.name});

  factory Source.fromApi(Map<String, dynamic> json) {
    return Source(name: json['name'] ?? '');
  }
}