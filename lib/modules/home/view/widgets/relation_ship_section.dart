import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class RelationshipSelectionWrap extends StatelessWidget {
  final HomeController controller;

  const RelationshipSelectionWrap({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        RelationshipOption(controller: controller, relationship: 'Parent'),
        RelationshipOption(controller: controller, relationship: 'Partner'),
        RelationshipOption(controller: controller, relationship: 'Children'),
        RelationshipOption(controller: controller, relationship: 'Sibling'),
        RelationshipOption(controller: controller, relationship: 'Relative'),
        RelationshipOption(controller: controller, relationship: 'Friend'),
        RelationshipOption(controller: controller, relationship: 'Other'),
      ],
    );
  }
}

class RelationshipOption extends StatelessWidget {
  final HomeController controller;
  final String relationship;

  const RelationshipOption({
    super.key,
    required this.controller,
    required this.relationship,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedRelationship.value == relationship;
      return InkWell(
        onTap: () => controller.selectedRelationship.value = relationship,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white, // Always white background
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? const Color(0xFF2C3E50) : const Color(0xFFE9ECEF), // Only border changes
              width: isSelected ? 2 : 1, // Optional: make selected border thicker
            ),
          ),
          child: Text(
            relationship,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF2C3E50), // Text color stays the same
            ),
          ),
        ),
      );
    });
  }
}