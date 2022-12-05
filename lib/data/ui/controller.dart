

import 'package:flutter/material.dart';
import 'package:web_services_dio/data/models/newUserModel.dart';
import 'package:web_services_dio/data/models/userModel.dart';
import 'package:web_services_dio/data/network/repository/userRepository.dart';
import 'package:web_services_dio/data/ui/service_locator.dart';

class HomeController {
  // --------------- Repository -------------
  final userRepository = getIt<UserRepository>();

  // -------------- Textfield Controller ---------------
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  // -------------- Local Variables ---------------
  final List<NewUser> newUsers = [];

  get idController => TextEditingController();

 


  // -------------- Methods ---------------

  Future<List<UserModel>> getUsers() async {
    final users = await userRepository.getUsersRequested();
    return users;
  }

  Future<NewUser> addNewUser() async {
    final newlyAddedUser = await userRepository.addNewUserRequested(
      nameController.text,
      jobController.text,
    );
    newUsers.add(newlyAddedUser);
    return newlyAddedUser;
  }

  Future<NewUser> updateUser(int id, String name, String job) async {
    final updatedUser = await userRepository.updateUserRequested(
      id,
      name,
      job,
    );
    newUsers[id] = updatedUser;
    return updatedUser;
  }

  Future<void> deleteNewUser(int id) async {
    await userRepository.deleteNewUserRequested(id);
    newUsers.removeAt(id);
  }
}
