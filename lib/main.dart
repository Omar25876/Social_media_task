import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/service/service_locator.dart';

void main()async {

  initServiceLocator();
  ///todo : 200

  runApp(const SocialMediaFeedApp(),);
}


