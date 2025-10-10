import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/view/widgets/user_info.dart';
import 'package:oxygen/modules/home/view/widgets/user_menu.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, 
      backgroundColor: AppColors.white,
      elevation: 1,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/logo.png", height: 60, fit: BoxFit.contain),
      ),
      leadingWidth: 180,
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Spacer(),
            const UserInfo(),
            const SizedBox(width: 12),
            const CircleAvatar(radius: 20, backgroundColor: Colors.grey,backgroundImage: AssetImage("assets/image (1).png"),),
            const UserMenu(),
          ],
        ),
      ),
    );
  }
}