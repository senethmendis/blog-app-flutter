class BlogPostModel {
  String id;
  String title;
  String author;
  String category;
  String description;
  String coverImage;
  String userid;

  BlogPostModel({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.coverImage,
    required this.userid,
  });

  factory BlogPostModel.fromJson(Map<String, dynamic> json) {
    return BlogPostModel(
      id: json["id"],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      coverImage: json['coverimage'],
      userid: json['userid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "author": author,
      "category": category,
      "description": description,
      "coverimage": coverImage,
      "userid": userid,
    };
  }
}
