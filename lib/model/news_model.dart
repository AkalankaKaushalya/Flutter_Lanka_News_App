class News {
  final String title;
  final String description;
  final String urlToImage;
  final String author;
  final String publishedAt;
  final String content;

  News({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.author,
    required this.publishedAt,
    required this.content,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description',
      urlToImage: json['urlToImage'] ?? 'No image',
      author: json['author'] ?? 'No author',
      publishedAt: json['publishedAt'] ?? 'No publishedAt',
      content: json['content'] ?? 'No content',
    );
  }

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'author': author,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  static fromMap(Map<String, Object?> json) {
    return News(
      title: json['title'] as String,
      description: json['description'] as String,
      urlToImage: json['urlToImage'] as String,
      author: json['author'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }

  Map<String, dynamic> toMapp() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'author': author,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  static News fromMapp(Map<String, dynamic> map) {
    return News(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
      author: map['author'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
}
