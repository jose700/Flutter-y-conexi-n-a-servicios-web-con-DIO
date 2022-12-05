import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:web_services_dio/data/network/api/dio_client.dart';
import 'package:web_services_dio/data/network/api/user_api.dart';
import 'package:web_services_dio/data/network/repository/userRepository.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
 
  BuildContext context = getIt.get<BuildContext>();
  getIt.registerSingleton<BuildContext>(context);

}
