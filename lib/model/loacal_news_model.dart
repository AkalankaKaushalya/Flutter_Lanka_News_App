class LoacalNewsModel {
  final String title;
  final String description;
  final String urlToImage;
  final String author;
  final String publishedAt;
  final String content;

  LoacalNewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.author,
    required this.publishedAt,
    required this.content,
  });

  // Map<String, dynamic> toMapp() {
  //   return {
  //     'title': title,
  //     'description': description,
  //     'urlToImage': urlToImage,
  //     'author': author,
  //     'publishedAt': publishedAt,
  //     'content': content,
  //   };
  // }

  // static LoacalNewsModel fromMapp(Map<String, dynamic> map) {
  //   return LoacalNewsModel(
  //     title: map['title'] ?? '',
  //     description: map['description'] ?? '',
  //     urlToImage: map['urlToImage'] ?? '',
  //     author: map['author'] ?? '',
  //     publishedAt: map['publishedAt'] ?? '',
  //     content: map['content'] ?? '',
  //   );
  // }
}
