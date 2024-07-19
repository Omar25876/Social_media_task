import 'package:flutter/material.dart';
import 'package:social_media_feed/feature/home/presentation/screens/post_screen.dart';
class Routes {
  static const String initialRoute = '/';


}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const PostsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
