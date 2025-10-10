import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    // 💡 For smaller devices, use BottomNavigationBar instead of Sidebar
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
      color: Colors.white,
      child: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.chevron_left),
                color: Colors.grey.shade600,
                onPressed: () {
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 24),
              children: [
                _buildMenuItem(
                  icon: "assets/home.png",
                  label: 'Home',
                  isActive: true,
                ),
                _buildMenuItem(
                  icon: "assets/clip.png",
                  label: 'Appointments',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: "assets/doctor-01.png",
                  label: 'Doctors',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: "assets/patient.png",
                  label: 'Patients',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: "assets/invoice-04.png",
                  label: 'Bills',
                  isActive: false,
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
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isActive ? AppColors.accent : Colors.transparent,
            width: 4,
          ),
        ),
        color: isActive ? Colors.red.shade50 : Colors.transparent,
      ),
      child: ListTile(
        leading: Image.asset(icon),
        title: Text(
          label,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        onTap: () {
          // TODO: Add navigation logic
        },
      ),
    );
  }
}
