import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:social_media_feed/feature/home/data/datasource/post_remote_data_source.dart';
import 'package:social_media_feed/feature/home/data/repository/movies_repository.dart';
import 'package:social_media_feed/feature/home/domain/repository/base_posts_repository.dart';
import 'package:social_media_feed/feature/home/domain/usecases/get_posts_usecase.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_bloc.dart';
import '../database/api/api_consumer.dart';
import '../database/api/dio_consumer.dart';


final sl = GetIt.instance;


void initServiceLocator(){
  /// Bloc
  sl.registerFactory(() => PostsBloc(sl()));

  /// Use Cases
  sl.registerLazySingleton(() => GetPostsUseCase(sl()));


  /// Repository
   sl.registerLazySingleton<BasePostsRepository>(
           () => PostsRepository(sl()));

   /// DATA SOURCE
   sl.registerLazySingleton<BasePostRemoteDataSource>(
           () => PostRemoteDataSource());



  sl.registerLazySingleton<ApiConsumer>(()=>DioConsumer(sl()));
  sl.registerLazySingleton(()=>Dio());


}