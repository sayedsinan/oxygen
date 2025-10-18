import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/patient_card.dart';
import 'package:oxygen/modules/home/view/widgets/patient_list_header.dart';
import 'package:oxygen/modules/home/view/widgets/register_new_button.dart';

class PatientListView extends StatelessWidget {
  final HomeController controller;

  const PatientListView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PatientListHeader(controller: controller),
            const SizedBox(height: 20),
            PatientCard(
              name: 'Floyd Miles',
              phone: '+7 (903) 880-93-38',
              lastVisit: 'Last visit 12-04-25',
              imageUrl: 'https://i.pravatar.cc/150?img=12',
              onTap: () {
                controller.selectPatient('Floyd Miles');
              },
            ),
            // const SizedBox(height: 12),
            PatientCard(
              name: 'Leslie Alexander',
              phone: '+7 (903) 880-93-38',
              imageUrl: 'https://i.pravatar.cc/150?img=45',
              onTap: () {
                controller.selectPatient('Leslie Alexander');
              },
            ),
            const SizedBox(height: 20),
            RegisterNewPatientWithNumberButton(controller: controller),
          ],
        ),
      ),
    );
  }
}
