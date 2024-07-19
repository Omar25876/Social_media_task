import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String id;
  final String username;
  final String profilePicture;
  final String postImage;
  final String description;
  final int likes;


  Post({
    required this.id,
    required this.username,
    required this.profilePicture,
    required this.postImage,
    required this.description,
    required this.likes,

  });


  @override
  List<Object?> get props => [
    username,
    profilePicture,
    postImage,
    description,
    likes,

  ];
}
