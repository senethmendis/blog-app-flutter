import 'package:blog_app/models/blog_model.dart';

class DemoData {
  static List<Map<int, String>> sliberImages = [
    {
      1: "Technology",
      2: "https://i.pinimg.com/736x/76/80/13/76801354a0f2805873e32744b3c0a09a.jpg"
    },
    {
      1: "Cooking",
      2: "https://images.nightcafe.studio/jobs/Q3YqZTqdQ4k1eye7kfQS/Q3YqZTqdQ4k1eye7kfQS--1--2hqpa.jpg?tr=w-1600,c-at_max"
    },
    {
      1: "Fiction",
      2: "https://assetsio.reedpopcdn.com/league-of-legends-lo-fi-album.jpg?width=1600&height=900&fit=crop&quality=100&format=png&enable=upscale&auto=webp"
    },
    {1: "History", 2: "https://i.ytimg.com/vi/DsPI092lWN0/maxresdefault.jpg"},
    {
      1: "Science",
      2: "https://cdnb.artstation.com/p/assets/images/images/042/324/883/large/space-gooose-lofi-artstation.jpg?1634190698"
    },
  ];

  static List<BlogPostModel> blogs = [
    BlogPostModel(
        id: '1',
        title: "The Adventure Begins",
        author: "John Doe",
        category: "Fiction",
        description: "A thrilling journey into the unknown.",
        coverImage: "https://pbs.twimg.com/media/F2zmOB0XUAArrGA.jpg:large",
        userid: ""),

    // Mention 2
    BlogPostModel(
        id: '2',
        title: "Coding 101",
        author: "Jane Smith",
        category: "Technology",
        description: "A beginner's guide to coding.",
        coverImage:
            "https://pbs.twimg.com/media/F2zmE5FXkAEmCbz?format=jpg&name=large",
        userid: ""),

    // Mention 3
    BlogPostModel(
        id: '3',
        title: "Cooking Delights",
        author: "Chef Michael",
        category: "Cooking",
        description: "Discover the art of culinary masterpieces.",
        coverImage:
            "https://www.bhmpics.com/downloads/lofi-background/10.k-empty-moody-anime-scenery-colored-clouds-dusk-lofi-artwork-style-japanese-outdoors-landscape-dusk-mountains-253207554.jpg",
        userid: ""),

    // Mention 4
    BlogPostModel(
        id: '4',
        title: "History Unveiled",
        author: "Professor Anderson",
        category: "History",
        description: "Exploring the untold stories of the past.",
        coverImage: "https://i.ytimg.com/vi/yLn2wLqt2DE/maxresdefault.jpg",
        userid: ""),

    // Mention 5
    BlogPostModel(
        id: '5',
        title: "Space Odyssey",
        author: "Astronaut Emily",
        category: "Science",
        description:
            "Journey through the cosmos with an astronaut's perspective.",
        coverImage: "https://i.ytimg.com/vi/4w9QyEJ--BE/maxresdefault.jpg",
        userid: ""),
  ];
}
