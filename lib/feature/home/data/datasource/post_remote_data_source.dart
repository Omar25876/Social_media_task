import 'package:dio/dio.dart';
import 'package:social_media_feed/core/database/api/end_points.dart';
import 'package:social_media_feed/core/error/exceptions.dart';
import 'package:social_media_feed/core/network/error_message_model.dart';
import 'package:social_media_feed/feature/home/data/models/post_model.dart';

abstract class BasePostRemoteDataSource {
  Future<List<PostModel>> getPosts();


}

class PostRemoteDataSource extends BasePostRemoteDataSource {

  @override
  Future<List<PostModel>> getPosts() async {
    final response = await Dio().get(EndPoint.postsPath);
    print('ooooooooooooooooooooooooooooo');
    print(response.data);
    if (response.statusCode == 200) {
      return List<PostModel>.from((response.data as List).map(
            (e) => PostModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


}
