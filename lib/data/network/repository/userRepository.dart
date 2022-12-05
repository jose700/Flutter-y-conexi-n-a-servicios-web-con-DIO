import 'package:dio/dio.dart';
import 'package:web_services_dio/data/models/newUserModel.dart';
import 'package:web_services_dio/data/models/userModel.dart';
import 'package:web_services_dio/data/network/api/dio_exception.dart';
import 'package:web_services_dio/data/network/api/user_api.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> addNewUserRequested(String name, String job) async {
    try {
      final response = await userApi.addUserApi(name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<NewUser> updateUserRequested(int id, String name, String job) async {
    try {
      final response = await userApi.updateUserApi(id, name, job);
      return NewUser.fromJson(response.data);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
  
      throw errorMessage;
    }
  }
}
