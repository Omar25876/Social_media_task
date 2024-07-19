import 'package:equatable/equatable.dart';
import 'package:social_media_feed/core/utils/enums.dart';
import 'package:social_media_feed/feature/home/domain/entities/post.dart';

class PostsState extends Equatable {
  final List<Post> posts;
  final RequestState postsState;
  final String postsMessage;

  const PostsState({
    this.posts = const [],
    this.postsState = RequestState.loading,
    this.postsMessage = '',
  });

  PostsState copyWith({
    List<Post>? posts,
    RequestState? postsState,
    String? postsMessage,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      postsState: postsState ?? this.postsState,
      postsMessage: postsMessage ?? this.postsMessage,
    );
  }

  @override
  List<Object?> get props => [
        posts,
        postsState,
        postsMessage,
      ];
}
