import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/succes_action_button.dart';

class RegistrationSuccessView extends StatelessWidget {
  final HomeController controller;

  const RegistrationSuccessView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          SizedBox(
          
                    
            child: Center(
              child: Image.asset(
                'assets/Badge.png', // Replace with your image path
             
                // color: Colors.white, // Makes the image white
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Patient Registered Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 40),
          SuccessActionButtons(controller: controller),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}