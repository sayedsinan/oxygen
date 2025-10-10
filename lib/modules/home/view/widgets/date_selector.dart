

import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class DateSelector extends StatelessWidget {
  final HomeController controller;
  const DateSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.dates.asMap().entries.map((entry) {
          final index = entry.key;
          final date = entry.value;
          final isSelected = index == controller.selectedDateIndex.value;

          return GestureDetector(
            onTap: () => controller.selectDate("${date['date']} ${date['day']}", index),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE91E63) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(date['day']!, style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
                  Text(date['date']!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

