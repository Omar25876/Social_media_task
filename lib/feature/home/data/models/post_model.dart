import 'package:social_media_feed/feature/home/domain/entities/post.dart';

class PostModel extends Post {

  PostModel({
    required super.id,
    required super.username,
    required super.profilePicture,
    required super.postImage,
    required super.description,
    required super.likes,

  });

  // Convert a Post into a Map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'profilePicture': profilePicture,
    'postImage': postImage,
    'description': description,
    'likes': likes,

  };

  // Create a Post from a Map.
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      username: json['username'],
      profilePicture: json['profilePicture'],
      postImage: json['postImage'],
      description: json['description'],
      likes: json['likes'],

    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    profilePicture,
    postImage,
    description,
    likes,

  ];
}
