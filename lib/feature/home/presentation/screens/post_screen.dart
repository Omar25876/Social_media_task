import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_feed/core/service/service_locator.dart';
import 'package:social_media_feed/core/utils/app_strings.dart';
import 'package:social_media_feed/core/utils/enums.dart';
import 'package:social_media_feed/feature/home/presentation/components/post_component.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_bloc.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_event.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => sl<PostsBloc>()
        ..add(GetPostsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.homeTitle,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white),),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: BlocBuilder<PostsBloc, PostsState>(
            buildWhen: (previous, current) =>
            previous.postsState != current.postsState,
            builder: (context, state) {
              switch (state.postsState) {
                case RequestState.loading:
                  return const SizedBox(
                    height: 400.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case RequestState.loaded:
                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(color: Colors.grey.shade300,thickness: 8),
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return PostComponent(post:state.posts[index] ,);
                    },
                  );

                case RequestState.error:
                  return SizedBox(
                    height: 400.0,
                    child: Center(
                      child: Text(state.postsMessage),
                    ),
                  );
              }
            }),
      ),
    );
  }
}
