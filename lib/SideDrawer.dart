import 'package:dvnapp/theme/colors.dart';
import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: CustomColors.primaryColor,
          ),
          child: Text('Drawer Header',
              style: TextStyle(color: CustomColors.white)),
        ),
        ListTile(
          leading: const Icon(Icons.person_outline_outlined),
          title: const Text('Users'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: const Icon(Icons.event_available),
          title: const Text('Events'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: const Icon(Icons.book_outlined),
          title: const Text('Books'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: const Icon(Icons.messenger_outline),
          title: const Text('Messenger'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_outlined),
          title: const Text('Logout'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
