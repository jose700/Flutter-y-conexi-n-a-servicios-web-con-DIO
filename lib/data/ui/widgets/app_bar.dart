
import 'package:flutter/material.dart';
import 'package:web_services_dio/data/ui/new_user_page.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  const BaseAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Users'),
      actions: [
        TextButton(
          child: const Text(
            'NewUsers',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewUserPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}