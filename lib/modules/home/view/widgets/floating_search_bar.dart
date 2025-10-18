import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class FloatingSearchBar extends StatelessWidget {
  const FloatingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    
    return GestureDetector(
      onTap: () => controller.toggleOverlay(true),
      child: Container(
        height: 70,
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFE91E63),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 20,
              ),
            ),
            const Expanded(
              child: Text(
                'Search for patients, doctors, departments, or dates',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}