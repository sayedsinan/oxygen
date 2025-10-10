import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/app/theme/app_text_style.dart';
import 'package:oxygen/modules/home/view/widgets/appoinment_card.dart';
import 'package:oxygen/modules/home/view/widgets/side_menu.dart';
import 'package:oxygen/modules/home/view/widgets/stat_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Permanent Sidebar
          const SidebarMenu(),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // AppBar
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Albert Flores',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Receptionist',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                      ),
                      PopupMenuButton(
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.black54,
                        ),
                        itemBuilder: (context) => const [
                          PopupMenuItem(value: 1, child: Text('Profile')),
                          PopupMenuItem(value: 2, child: Text('Settings')),
                          PopupMenuItem(value: 3, child: Text('Logout')),
                        ],
                      ),
                    ],
                  ),
                ),

                // Main Content with Header and Search
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Blue Header Section
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.fromLTRB(
                                40,
                                30,
                                40,
                                80,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFF0A1F5C),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Register, Manage & Track',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
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

                            // Content below header
                            Container(
                              color: Colors.grey.shade50,
                              padding: const EdgeInsets.fromLTRB(
                                40,
                                60,
                                40,
                                40,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Statistics',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    children: [
                                      StatCard(
                                        label: "Booked",
                                        value: "200",
                                        icon: Icons.wallet,
                                        iconBgColor:AppColors.info,
                                        iconColor: AppColors.primaryLight,
                                      ),
                                          StatCard(
                                        label: "Booked",
                                        value: "200",
                                        icon: Icons.wallet,
                                        iconBgColor:AppColors.info,
                                        iconColor: AppColors.primaryLight,
                                      ),
                                        StatCard(
                                        label: "Booked",
                                        value: "200",
                                        icon: Icons.wallet,
                                        iconBgColor:AppColors.info,
                                        iconColor: AppColors.primaryLight,
                                      ),
                                        
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text("Todays Appoinments",style: AppTextStyles.h3,),
                            ),
                            Row(children: [ProfileCard(),ProfileCard(),ProfileCard()],)
                          ],
                        ),

                        Positioned(
                          top: 150,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              height: 70,
                              width: 500, 
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(28),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      'Search for patients, doctors, departments, or dates',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 14,
                                  ),
                                  prefixIcon: Container(
                                    margin: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE91E63),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.search,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
