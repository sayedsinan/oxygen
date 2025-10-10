import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: Colors.black54),
      itemBuilder: (context) => const [
        PopupMenuItem(value: 1, child: Text('Profile')),
        PopupMenuItem(value: 2, child: Text('Settings')),
        PopupMenuItem(value: 3, child: Text('Logout')),
      ],
    );
  }
}
