import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/view/widgets/stat_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      padding: const EdgeInsets.fromLTRB(40, 60, 40, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Statistics', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87)),
          const SizedBox(height: 20),
          Row(
            children: [
              const StatCard(label: "Booked", value: "200", icon: Icons.wallet, iconBgColor: AppColors.info, iconColor: AppColors.primaryLight),
              const StatCard(label: "Check In", value: "34", icon: Icons.person, iconBgColor: AppColors.success, iconColor: AppColors.primaryLight),
              StatCard(label: "Completed", value: "34", icon: Icons.check_circle, iconBgColor: AppColors.success, iconColor: AppColors.primaryLight),
            ],
          ),
        ],
      ),
    );
  }
}
