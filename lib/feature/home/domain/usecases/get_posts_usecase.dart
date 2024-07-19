import 'package:dartz/dartz.dart';
import 'package:social_media_feed/core/error/failure.dart';
import 'package:social_media_feed/core/usecase/base_usecase.dart';
import 'package:social_media_feed/feature/home/domain/entities/post.dart';
import 'package:social_media_feed/feature/home/domain/repository/base_posts_repository.dart';


class GetPostsUseCase
    extends BaseUseCase<List<Post>, NoParameters> {
  final BasePostsRepository basePostsRepository;

  GetPostsUseCase(this.basePostsRepository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParameters parameters) async {
    return await basePostsRepository.getPosts();
  }
}
