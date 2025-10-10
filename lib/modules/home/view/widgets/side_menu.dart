import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;


    if (isMobile) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.grey.shade600,
        onTap: (index) {
          // TODO: Handle navigation
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: 'Doctors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_outlined),
            label: 'Bills',
          ),
        ],
      );
    }

    // 💡 For tablet and desktop screens, show sidebar
    double sidebarWidth = isTablet ? 140 : 200;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.keyboard_double_arrow_left),
                color: Colors.grey.shade600,
                iconSize: 20,
                onPressed: () {},
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              children: [
                _buildMenuItem(
                  icon: "assets/home.png",
                  label: 'Home',
                  isActive: true,
                  isCompact: isTablet,
                ),
                _buildMenuItem(
                  icon: "assets/clip.png",
                  label: 'Appointments',
                  isActive: false,
                  isCompact: isTablet,
                ),
                _buildMenuItem(
                  icon: "assets/doctor-01.png",
                  label: 'Doctors',
                  isActive: false,
                  isCompact: isTablet,
                ),
                _buildMenuItem(
                  icon: "assets/patient.png",
                  label: 'Patients',
                  isActive: false,
                  isCompact: isTablet,
                ),
                _buildMenuItem(
                  icon: "assets/invoice-04.png",
                  label: 'Bills',
                  isActive: false,
                  isCompact: isTablet,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    required bool isActive,
    bool isCompact = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          // 🔴 Left vertical active indicator
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 3,
            height: 44,
            color: isActive ? AppColors.accent : Colors.transparent,
          ),
          Expanded(
            child: Container(
              height: 44,
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    icon,
                    width: 20,
                    height: 20,
                    color: isActive ? Colors.black87 : Colors.grey.shade400,
                  ),
                  if (!isCompact) const SizedBox(width: 12),
                  if (!isCompact)
                    Flexible(
                      child: Text(
                        label,
                        overflow: TextOverflow.clip, 
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          color:
                              isActive ? Colors.black87 : Colors.grey.shade400,
                          fontSize: 14,
                          fontWeight:
                              isActive ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
