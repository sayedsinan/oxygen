import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
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
                  icon: Icons.home_outlined,
                  label: 'Home',
                  isActive: true,
                ),
                _buildMenuItem(
                  icon: Icons.calendar_today_outlined,
                  label: 'Appointments',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: Icons.people_outline,
                  label: 'Doctors',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: Icons.person_outline,
                  label: 'Patients',
                  isActive: false,
                ),
                _buildMenuItem(
                  icon: Icons.receipt_outlined,
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
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isActive ?AppColors.accent : Colors.transparent,
            width: 4,
          ),
        ),
        color: isActive ? Colors.red.shade50 : Colors.transparent,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey.shade600,
          size: 22,
        ),
        title: Text(
          label,
          style: TextStyle(
            color:Colors.grey.shade600,
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        onTap: () {
       
        },
      ),
    );
  }
}

