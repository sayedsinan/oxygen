import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class SelectedChipsRow extends StatelessWidget {
  final HomeController controller;
  final double width;

  const SelectedChipsRow({super.key, required this.controller, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: _buildSelectedChips()),
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFE91E63),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text('Book'),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSelectedChips() {
    final chips = <Widget>[];

    void addChip(String label, String value, IconData icon, VoidCallback onDelete) {
      chips.add(Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: Colors.green),
            const SizedBox(width: 6),
            Text("$label: ", style: const TextStyle(fontSize: 12)),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(width: 6),
            GestureDetector(onTap: onDelete, child: const Icon(Icons.close, size: 16)),
          ],
        ),
      ));
    }

    if (controller.selectedDoctor?.value != '') {
      addChip('Doctor', controller.selectedDoctor!.value, Icons.person,
          () => controller.selectedDoctor?.value = '');
    }
    if (controller.selectedDate?.value != '') {
      addChip('Date', controller.selectedDate!.value, Icons.calendar_today,
          () => controller.selectedDate?.value = '');
    }

    if (chips.isEmpty) {
      chips.add(const Text('No filters selected', style: TextStyle(color: Colors.white70)));
    }

    return chips;
  }
}
