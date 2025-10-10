import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text('Albert Flores', style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w500)),
        Text('Receptionist', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
