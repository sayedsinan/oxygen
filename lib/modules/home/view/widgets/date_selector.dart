import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:intl/intl.dart';

class DateSelector extends StatelessWidget {
  final HomeController controller;
  const DateSelector({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
       
          ...controller.dates.asMap().entries.map((entry) {
            final index = entry.key;
            final date = entry.value;
            final isSelected = index == controller.selectedDateIndex.value &&
                controller.selectedDate.value == date['date'];

            return GestureDetector(
              onTap: () => controller.selectDate(date['date']!, index),
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFE91E63) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      date['day']!,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      date['date']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
      
         GestureDetector(
  onTap: () => _showDatePicker(context),
  child: Container(
    margin: const EdgeInsets.only(right: 8),
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: _isCustomDateSelected()
          ? const Color(0xFFE91E63)
          : Colors.grey[200],
    ),
    child: Icon(
      Icons.arrow_drop_down,
      color: _isCustomDateSelected()
          ? Colors.white
          : Colors.grey[700],
      size: 28,
    ),
  ),
),

        ],
      ),
    ));
  }

  bool _isCustomDateSelected() {
  
    return controller.selectedDate.value.isNotEmpty &&
        !controller.dates.any((d) => d['date'] == controller.selectedDate.value);
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFFE91E63),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFE91E63),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      // Format the date as needed
      final fullDate = DateFormat('d MMM yyyy').format(pickedDate);
      
      // Set custom date (use -1 to indicate it's a custom date)
      controller.selectDate(fullDate, -1);
    }
  }
}