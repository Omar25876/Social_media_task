import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_media_feed/core/routes/app_routes.dart';
import 'package:social_media_feed/core/service/service_locator.dart';
import 'package:social_media_feed/core/theme/app_theme.dart';
import 'package:social_media_feed/core/utils/app_strings.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_bloc.dart';
import 'package:social_media_feed/feature/home/presentation/controller/posts_event.dart';


class SocialMediaFeedApp extends StatelessWidget {
  const SocialMediaFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,state){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.socialApp,
          theme: getAppTheme(),
          initialRoute: Routes.initialRoute,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
