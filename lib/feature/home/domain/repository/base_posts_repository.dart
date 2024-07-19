import 'package:dartz/dartz.dart';
import 'package:social_media_feed/core/error/failure.dart';
import 'package:social_media_feed/feature/home/domain/entities/post.dart';

abstract class BasePostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();

}
