import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:web_services_dio/data/network/api/dio_client.dart';
import 'package:web_services_dio/data/network/api/user_api.dart';
import 'package:web_services_dio/data/network/repository/userRepository.dart';
import 'package:web_services_dio/data/ui/home_page.dart';
import 'package:web_services_dio/data/ui/service_locator.dart';

import 'data/ui/controller.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  getIt.registerSingleton(HomeController());
  getIt.registerFactory(() => HomePage());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'Web Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: getIt<HomePage>(),
    );
  }
}
