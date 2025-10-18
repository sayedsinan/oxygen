import 'package:flutter/material.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
class RegisterPatientButton extends StatelessWidget {
  final HomeController controller;

  const RegisterPatientButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.showRegisterForm.value = true;
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        children: [
          Divider(color: AppColors.grey,thickness: .5,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
           
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE91E63),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_add_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Register new patient',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ],
            ),
          ),
       Divider(color: AppColors.grey,thickness: .5,),
        ],
      ),
    );
  }
}
