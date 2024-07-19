import 'package:dartz/dartz.dart';
import 'package:social_media_feed/core/error/exceptions.dart';
import 'package:social_media_feed/core/error/failure.dart';
import 'package:social_media_feed/feature/home/data/datasource/post_remote_data_source.dart';
import 'package:social_media_feed/feature/home/domain/entities/post.dart';
import 'package:social_media_feed/feature/home/domain/repository/base_posts_repository.dart';

class PostsRepository extends BasePostsRepository {
  final BasePostRemoteDataSource basePostRemoteDataSource;

  PostsRepository(this.basePostRemoteDataSource);

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    final result = await basePostRemoteDataSource.getPosts();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }


}
