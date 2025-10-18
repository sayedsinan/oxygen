import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';

class DoctorsList extends StatelessWidget {
  final HomeController controller;
  const DoctorsList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MOST POPULAR DOCTORS', style: TextStyle(color: Colors.blue.shade600, fontSize: 11, fontWeight: FontWeight.w600)),
        const SizedBox(height: 16),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.doctors.length,
          itemBuilder: (context, index) {
            final doc = controller.doctors[index];
            return InkWell(
              onTap: () => controller.selectDoctor(doc['name']),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: doc['color'],
                      backgroundImage: doc['image'] != null ? AssetImage(doc['image']) : null,
                      child: doc['image'] == null ? Text(doc['initial'], style: const TextStyle(color: Colors.white, fontSize: 16)) : null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doc['name'], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Text(doc['specialty'], style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(color: Colors.grey.shade400, shape: BoxShape.circle),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.cashBox,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(doc['specialty'], style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                              ),
                              SizedBox(width: 6),
                               Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: AppColors.greyLight,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(doc['timing'], style: TextStyle(color: Colors.grey.shade700, fontSize: 11)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                      
                        if (doc['nextSlot'] != null)
                          Row(
                            children: [
                              Text('Next Available Slot:', style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color:  const Color.fromARGB(97, 212, 0, 249),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(doc['nextSlot'], style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          )
                        else if (doc['nextToken'] != null)
                          Row(
                            children: [
                              Text('Next Available Token:', style: TextStyle(color: Colors.grey.shade600, fontSize: 11)),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color:  const Color.fromARGB(97, 212, 0, 249),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(doc['nextToken'].toString(), style: TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
