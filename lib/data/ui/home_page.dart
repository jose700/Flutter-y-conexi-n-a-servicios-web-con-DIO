import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:web_services_dio/data/models/userModel.dart';
import 'package:web_services_dio/data/ui/controller.dart';
import 'package:web_services_dio/data/ui/service_locator.dart';
import 'package:web_services_dio/data/ui/widgets/add_user_btn.dart';
import 'package:web_services_dio/data/ui/widgets/app_bar.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(HomeController());
//register BuilContext
  getIt.registerFactory(() => HomePage());
  

}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
     appBar: const BaseAppBar(),
      floatingActionButton: AddUserBtn(),
      body: FutureBuilder<List<UserModel>>(
        future: homeController.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text(
                "Error: " + error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No data'),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return ListTile(
                  leading: user.avatar != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            user.avatar!,
                            width: 50,
                            height: 50,
                          ),
                        )
                      : null,
                  title: Text(user.email ?? ''),
                  subtitle: Text(user.firstName ?? ''),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }

}