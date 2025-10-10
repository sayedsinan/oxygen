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
    final width = MediaQuery.of(context).size.width;
    final bubbleWidth = width > 600 ? 600.0 : width * 0.95;

    return Obx(() {
      if (!controller.showSearchOverlay.value) return const SizedBox.shrink();

      final _ = controller.selectedDoctor.value;
      final __ = controller.selectedDate.value;
      final ___ = controller.selectedPatient.value;
      final ____ = controller.searchQuery.value;

      return Stack(
        children: [

          Positioned.fill(
            child: GestureDetector(
              onTap: () => controller.toggleOverlay(false),
              child: Container(color: Colors.black.withOpacity(0.4)),
            ),
          ),


          Positioned(
            top: 90,
            left: (width - bubbleWidth) / 2,
            width: bubbleWidth,
            child: SelectedChipsRow(
              controller: controller,
              width: bubbleWidth,
            ),
          ),

          Positioned(
            top: 160,
            left: (width - bubbleWidth) / 2,
            width: bubbleWidth,
            child: SearchFieldBubble(
              controller: controller,
              width: bubbleWidth,
            ),
          ),
          Positioned(
            top: 250,
            left: (width - bubbleWidth) / 2,
            width: bubbleWidth,
            height: 400,
            child: controller.searchQuery.isEmpty
                ? CombinedBubble(
                    controller: controller,
                    width: bubbleWidth,
                    height: 400,
                  )
                : SearchResultsList(
                    controller: controller,
                    width: bubbleWidth,
                    height: 400,
                  ),
          ),
        ],
      );
    });
  }
}