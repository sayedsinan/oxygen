import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class SearchFieldBubble extends StatelessWidget {
  final HomeController controller;
  final double width;

  const SearchFieldBubble({super.key, required this.controller, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 8))
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFE91E63),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.search, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search for patients, doctors, departments, or dates',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => controller.toggleOverlay(false),
          ),
        ],
      ),
    );
  }
}
