class UserModel {
  String name;
  String image;
  String email;
  String uid;
  List<String> bookmark;
  List<String> bloglist;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    required this.uid,
    required this.bookmark,
    required this.bloglist,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        email: json['email'],
        image: json['image'],
        uid: json['uid'],
        bookmark:
            json['bookmark'] == null ? [] : List<String>.from(json['bookmark']),
        bloglist: json['bloglist'] == null
            ? []
            : List<String>.from(json['bloglist']));
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'uid': uid,
    };
  }
}
