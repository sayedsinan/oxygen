import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/date_doctor_list.dart';
import 'package:oxygen/modules/home/view/widgets/seach_field.dart';
import 'package:oxygen/modules/home/view/widgets/selected_chips.dart';

class SearchOverlayBar extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  SearchOverlayBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bubbleWidth = width > 600 ? 600.0 : width * 0.95;

    return Obx(() {
      if (!controller.showSearchOverlay.value) return const SizedBox.shrink();

      return Stack(
        children: [
          // Background dim
          GestureDetector(
            onTap: () => controller.toggleOverlay(false),
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),

          // Selected Chips + Book Button
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: SelectedChipsRow(controller: controller, width: bubbleWidth),
            ),
          ),

          // Search Field Bubble
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: Center(
              child: SearchFieldBubble(controller: controller, width: bubbleWidth),
            ),
          ),

          // Combined Bubble: Date Selector + Doctors List
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: CombinedBubble(controller: controller, width: bubbleWidth, height: 400),
            ),
          ),
        ],
      );
    });
  }
}

/// Selected Chips + Book Button

/// Search Field Bubble

/// Combined Bubble: Date Selector + Doctors List

/// Date Selector
/// Doctors List
