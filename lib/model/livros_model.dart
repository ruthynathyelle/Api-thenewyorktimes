class Livro {
  final String title;
  final String author;
  final String description;
  final String imageUrl;

  Livro({
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
  });

  factory Livro.fromJson(Map<String, dynamic> json) {
    return Livro(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      imageUrl: json['book_image'],
    );
  }
}


