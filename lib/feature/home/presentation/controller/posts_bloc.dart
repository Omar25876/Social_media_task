import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_feed/core/usecase/base_usecase.dart';
import 'package:social_media_feed/core/utils/enums.dart';
import 'package:social_media_feed/feature/home/domain/usecases/get_posts_usecase.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_event.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPostsUseCase getPostsUseCase;

  PostsBloc(
    this.getPostsUseCase,
  ) : super(const PostsState()) {
    on<GetPostsEvent>(_getPosts);
  }

  FutureOr<void> _getPosts(
      GetPostsEvent event, Emitter<PostsState> emit) async {
    final result = await getPostsUseCase(const NoParameters());
    result.fold(
      (l) => emit(state.copyWith(
        postsState: RequestState.error,
        postsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          posts: r,
          postsState: RequestState.loaded,
        ),
      ),
    );
  }
}
