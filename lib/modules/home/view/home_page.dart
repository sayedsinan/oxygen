import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/app_bar.dart';
import 'package:oxygen/modules/home/view/widgets/appointment_seciton.dart';
import 'package:oxygen/modules/home/view/widgets/blue_header.dart';
import 'package:oxygen/modules/home/view/widgets/floating_search_bar.dart';
import 'package:oxygen/modules/home/view/widgets/search_overlay_bar.dart';
import 'package:oxygen/modules/home/view/widgets/side_menu.dart';

import 'package:oxygen/modules/home/view/widgets/stat_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.grey.shade50,
      body: Stack(
        children: [
          Row(
            children: [
              const SidebarMenu(),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          MyAppBar(),
                          BlueHeader(),
                          SizedBox(height: 60),
                          StatisticsSection(),
                          TodayAppointmentsSection(),
                          SizedBox(height: 120), 
                        ],
                      ),
                    ),
                    const FloatingSearchBar(),
                  ],
                ),
              ),
            ],
          ),
         SearchOverlayBar()
        ],
      ),
    );
  }
}

/// -------------------- Widgets --------------------






