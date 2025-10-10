import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/view/widgets/stat_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 800;

        return Container(
          padding: EdgeInsets.fromLTRB(isMobile ? 20 : 40, 60, isMobile ? 20 : 40, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        StatCard(
                          label: "Booked",
                          value: "200",
                          icon: "assets/credit_card.png",
                          iconBgColor: AppColors.cardBox,
                          iconColor: AppColors.card,
                        ),
                        SizedBox(height: 16),
                        StatCard(
                          label: "Check In",
                          value: "34",
                          icon: "assets/payments.png",
                          iconBgColor: AppColors.cashBox,
                          iconColor: AppColors.cash,
                        ),
                        SizedBox(height: 16),
                        StatCard(
                          label: "Completed",
                          value: "34",
                          icon: "assets/qr_code_2.png",
                          iconBgColor: AppColors.qrBox,
                          iconColor: AppColors.qr,
                        ),
                      ],
                    )
                  : IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Expanded(
                            child: StatCard(
                              label: "Booked",
                              value: "200",
                              icon: "assets/credit_card.png",
                                iconBgColor: AppColors.cardBox,
                          iconColor: AppColors.card,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: StatCard(
                              label: "Check In",
                              value: "34",
                              icon: "assets/payments.png",
                              iconBgColor: AppColors.cashBox,
                              iconColor: AppColors.cash,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: StatCard(
                              label: "Completed",
                              value: "34",
                              icon: "assets/qr_code_2.png",
                              iconBgColor: AppColors.qrBox,
                              iconColor: AppColors.qr,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}