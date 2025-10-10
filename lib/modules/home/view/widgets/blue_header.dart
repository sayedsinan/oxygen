import 'package:flutter/material.dart';

class BlueHeader extends StatelessWidget {
  const BlueHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(40, 30, 40, 80),
      decoration: const BoxDecoration(
        color: Color(0xFF0A1F5C),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Register, Manage & Track', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Access, Update and track all patients Update', style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }
}

