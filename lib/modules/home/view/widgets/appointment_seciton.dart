import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_text_style.dart';
import 'package:oxygen/modules/home/view/widgets/appoinment_card.dart';
class TodayAppointmentsSection extends StatelessWidget {
  const TodayAppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today's Appointments", style: AppTextStyles.h3),
          const SizedBox(height: 12),
          Row(
            children: const [
              ProfileCard(),
              ProfileCard(),
              ProfileCard(),
            ],
          ),
        ],
      ),
    );
  }
}
