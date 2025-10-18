import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/controller/home_controller.dart';
import 'package:oxygen/modules/home/view/widgets/action_button.dart';
import 'package:oxygen/modules/home/view/widgets/dashed_divider.dart';
import 'package:oxygen/modules/home/view/widgets/discount_consultation.dart';
import 'package:oxygen/modules/home/view/widgets/partial_payment.dart';
import 'package:oxygen/modules/home/view/widgets/patient_info.dart';
import 'package:oxygen/modules/home/view/widgets/payment_method.dart';
import 'package:oxygen/modules/home/view/widgets/three_coloum_info.dart';
import 'package:oxygen/app/theme/app_colors.dart';

class CheckInScreen extends StatefulWidget {
  final HomeController controller;
  final double upiAmount;
  final double cashAmount;
  final bool isPartialPaymentEnabled;
  final ValueChanged<bool> onPartialPaymentChanged;
  final TextEditingController discountController;
  final TextEditingController partialAmountController;
  final String selectedPaymentMethod;
  final ValueChanged<String> onPaymentMethodChanged;
  final VoidCallback onBack;

  const CheckInScreen({
    super.key,
    required this.controller,
    required this.upiAmount,
    required this.cashAmount,
    required this.isPartialPaymentEnabled,
    required this.onPartialPaymentChanged,
    required this.discountController,
    required this.partialAmountController,
    required this.selectedPaymentMethod,
    required this.onPaymentMethodChanged,
    required this.onBack,
  });

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  bool showSuccessMessage = false;

  @override
  Widget build(BuildContext context) {
    if (showSuccessMessage) {
      return CheckInSuccessMessage(
        onExitToDashboard: () {
          setState(() => showSuccessMessage = false);
          widget.onBack();
        },
        onDone: () {
          setState(() => showSuccessMessage = false);
          widget.onBack();
        },
      );
    }

    double consultationFee = 350;
    double discountAmount = double.tryParse(widget.discountController.text) ?? 0;
    double partialAmount = double.tryParse(widget.partialAmountController.text) ?? 0;
    double balanceDue = consultationFee - discountAmount - partialAmount;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Patient Info
          const PatientInfoRow(),
          const SizedBox(height: 20),
          
          // Three columns info
          const ThreeColumnsInfo(),
          const SizedBox(height: 20),
          
          // Consultation Fee & Discount
          ConsultationFeeDiscount(
            consultationFee: consultationFee,
            discountController: widget.discountController,
          ),
          const SizedBox(height: 20),
          
          // Dashed divider
          const DashedDivider(),
          const SizedBox(height: 20),
          
          // Payment methods
          PaymentMethodSection(
            selectedPaymentMethod: widget.selectedPaymentMethod,
            onPaymentMethodChanged: widget.onPaymentMethodChanged,
            upiAmount: widget.upiAmount,
            cashAmount: widget.cashAmount,
            isPartialPaymentEnabled: widget.isPartialPaymentEnabled,
            onPartialPaymentChanged: widget.onPartialPaymentChanged,
          ),
          
          // Partial payment amount input
          if (widget.isPartialPaymentEnabled) ...[
            const SizedBox(height: 16),
            PartialPaymentSection(
              partialAmountController: widget.partialAmountController,
              balanceDue: balanceDue,
            ),
          ],
          
          const SizedBox(height: 24),
          
          // Action buttons
          ActionButtons(
            onBack: widget.onBack,
            onCheckInNow: () {
              setState(() => showSuccessMessage = true);
            },
          ),
        ],
      ),
    );
  }
}

// Check-In Success Message
class CheckInSuccessMessage extends StatelessWidget {
  final VoidCallback onExitToDashboard;
  final VoidCallback onDone;

  const CheckInSuccessMessage({
    super.key,
    required this.onExitToDashboard,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    const double buttonWidth = 180;
    const double buttonHeight = 48;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Success Icon
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/Badge.png", width: 60, height: 60)
          ),
          const SizedBox(height: 24),
          
          // Success Message
          const Text(
            'Check-In Successful!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          
          // Subtitle
          Text(
            'Payment completed successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 40),
          
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: OutlinedButton(
                  onPressed: onExitToDashboard,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.black, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Exit to Dashboard',
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: buttonWidth,
                height: buttonHeight,
                child: ElevatedButton(
                  onPressed: onDone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE91E63),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}