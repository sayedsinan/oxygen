import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/user_info.dart';
import 'package:oxygen/modules/home/view/widgets/user_menu.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          Image.asset("assets/logo.png", height: 40, fit: BoxFit.contain),
          const Spacer(),
          const UserInfo(),
          const SizedBox(width: 12),
          const CircleAvatar(radius: 20, backgroundColor: Colors.grey),
          const UserMenu(),
        ],
      ),
    );
  }
}
