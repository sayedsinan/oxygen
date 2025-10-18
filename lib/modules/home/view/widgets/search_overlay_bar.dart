import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/date_doctor_list.dart';
import 'package:oxygen/modules/home/view/widgets/seach_field.dart';
import 'package:oxygen/modules/home/view/widgets/search_result_list.dart';
import 'package:oxygen/modules/home/view/widgets/selected_chips.dart';

class SearchOverlayBar extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  SearchOverlayBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // 📱 Responsiveness breakpoints
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    final bool isDesktop = screenWidth >= 1024;

    // 🎨 Adjust bubble dimensions dynamically
    final double bubbleWidth = isMobile
        ? screenWidth * 0.9
        : isTablet
            ? screenWidth * 0.75
            : 750; // for desktop

    final double bubbleHeight = isMobile
        ? screenHeight * 0.6
        : isTablet
            ? screenHeight * 0.7
            : 588;

    return Obx(() {
      if (!controller.showSearchOverlay.value) return const SizedBox.shrink();

      // Listen to reactive variables to rebuild properly
      final _ = controller.selectedDoctor.value;
      final __ = controller.selectedDate.value;
      final ___ = controller.selectedPatient.value;
      final ____ = controller.searchQuery.value;

      return Stack(
        children: [
          // 🔹 Dim background
          Positioned.fill(
            child: GestureDetector(
              onTap: () => controller.toggleOverlay(false),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),

          // 🔹 Centered floating search bubble
          Positioned(
            top: isMobile ? 10 : 20,
            left: (screenWidth - bubbleWidth) / 2,
            width: bubbleWidth,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 8 : 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectedChipsRow(
                      controller: controller,
                      width: bubbleWidth,
                    ),
                    SizedBox(height: isMobile ? 12 : 20),
                    SearchFieldBubble(
                      controller: controller,
                      width: bubbleWidth,
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
                    SizedBox(
                      width: bubbleWidth,
                      height: bubbleHeight,
                      child: controller.searchQuery.isEmpty
                          ? CombinedBubble(
                              controller: controller,
                              width: bubbleWidth,
                              height: bubbleHeight,
                            )
                          : SearchResultsList(
                              controller: controller,
                              width: bubbleWidth,
                              height: bubbleHeight,
                            ),
                    ),
                    SizedBox(height: isMobile ? 24 : 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
