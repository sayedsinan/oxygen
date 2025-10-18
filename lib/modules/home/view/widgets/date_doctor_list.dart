import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oxygen/app/theme/app_colors.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/check_in_screen.dart';
import 'package:oxygen/modules/home/view/widgets/date_selector.dart';
import 'package:oxygen/modules/home/view/widgets/doctor_list.dart';
import 'package:oxygen/modules/home/view/widgets/register_patient_button.dart';
import 'package:oxygen/modules/home/view/widgets/register_patient_form.dart';
import 'package:oxygen/modules/home/view/widgets/search_history_result.dart';

class CombinedBubble extends StatefulWidget {
  final HomeController controller;
  final double width;
  final double height;

  const CombinedBubble({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
  });

  @override
  State<CombinedBubble> createState() => _CombinedBubbleState();
}

class _CombinedBubbleState extends State<CombinedBubble> {
  bool showCheckInScreen = false;
  String selectedPaymentMethod = 'upi';
  double upiAmount = 100;
  double cashAmount = 250;
  bool isPartialPaymentEnabled = true;

  final TextEditingController discountController = TextEditingController(text: '50');
  final TextEditingController partialAmountController = TextEditingController(text: '300');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Obx(() {
        if (widget.controller.isBookingSuccessful.value) {
          return showCheckInScreen
              ? CheckInScreen(
                  controller: widget.controller,
                  upiAmount: upiAmount,
                  cashAmount: cashAmount,
                  isPartialPaymentEnabled: isPartialPaymentEnabled,
                  onPartialPaymentChanged: (val) => setState(() => isPartialPaymentEnabled = val),
                  discountController: discountController,
                  partialAmountController: partialAmountController,
                  selectedPaymentMethod: selectedPaymentMethod,
                  onPaymentMethodChanged: (val) => setState(() => selectedPaymentMethod = val),
                  onBack: () => setState(() => showCheckInScreen = false),
                )
              : SuccessMessage(
                  controller: widget.controller,
                  onCheckIn: () => setState(() => showCheckInScreen = true),
                );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!widget.controller.showRegisterForm.value) ...[
                SearchHistorySection(controller: widget.controller),
                const SizedBox(height: 16),
                DateSelector(controller: widget.controller),
                const SizedBox(height: 16),
                RegisterPatientButton(controller: widget.controller),
                const SizedBox(height: 16),
                DoctorsList(controller: widget.controller),
              ] else ...[
                RegisterPatientFormView(controller: widget.controller),
              ],
            ],
          ),
        );
      }),
    );
  }
}

// ------------------------ Success Message ------------------------
class SuccessMessage extends StatelessWidget {
  final HomeController controller;
  final VoidCallback onCheckIn;

  const SuccessMessage({
    super.key,
    required this.controller,
    required this.onCheckIn,
  });

  @override
  Widget build(BuildContext context) {
    const double buttonWidth = 150;
    const double buttonHeight = 48;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Badge.png'),
          const SizedBox(height: 24),
          const Text(
            'Appointment Booked Successfully!',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: () {
                    controller.isBookingSuccessful.value = false;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(color: AppColors.black, width: 1.5),
                    ),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text('Exit to Dashboard', style: TextStyle(fontSize: 12), maxLines: 1),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: onCheckIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Check In'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}