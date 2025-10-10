import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/app/theme/app_text_style.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/app_bar.dart';
import 'package:oxygen/modules/home/view/widgets/appointment_seciton.dart';
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
      drawer: const SidebarMenu(), // drawer for mobile
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 800;

          return Stack(
            children: [
              Column(
                children: [
                  const MyAppBar(),
                  Expanded(
                    child: Row(
                      children: [
                        if (!isMobile)
                          const SidebarMenu(), // only show sidebar on large screens

                        Expanded(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Blue header + floating search bar
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.fromLTRB(
                                              isMobile ? 20 : 40,
                                              30,
                                              isMobile ? 20 : 40,
                                              100),
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF0A1F5C),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const [
                                              Text(
                                                'Register, Manage & Track',
                                                style: AppTextStyles.h1,
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                'Access, Update and track all patients Update',
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          bottom: -35,
                                          left: isMobile ? 20 : 60,
                                          right: isMobile ? 20 : 60,
                                          child: const Center(
                                            child: FloatingSearchBar(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 80),
                                    const StatisticsSection(),
                                    const TodayAppointmentsSection(),
                                    const SizedBox(height: 120),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Dim overlay for search
              Obx(() {
                if (!controller.showSearchOverlay.value)
                  return const SizedBox.shrink();

                return GestureDetector(
                  onTap: () => controller.toggleOverlay(false),
                  child: Container(
                    color: Colors.black.withOpacity(0.4),
                  ),
                );
              }),

              // Search overlay bubble
               SearchOverlayBar(),
            ],
          );
        },
      ),
    );
  }
}
