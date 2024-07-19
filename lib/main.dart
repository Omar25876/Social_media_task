import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/service/service_locator.dart';

void main()async {

  initServiceLocator();

  runApp(const SocialMediaFeedApp(),);
}


