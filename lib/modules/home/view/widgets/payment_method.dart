import 'package:flutter/material.dart';
import 'package:oxygen/modules/home/view/widgets/payment_box.dart';

class PaymentMethodSection extends StatelessWidget {
  final String selectedPaymentMethod;
  final ValueChanged<String> onPaymentMethodChanged;
  final double upiAmount;
  final double cashAmount;
  final bool isPartialPaymentEnabled;
  final ValueChanged<bool> onPartialPaymentChanged;

  const PaymentMethodSection({
    super.key,
    required this.selectedPaymentMethod,
    required this.onPaymentMethodChanged,
    required this.upiAmount,
    required this.cashAmount,
    required this.isPartialPaymentEnabled,
    required this.onPartialPaymentChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        Widget paymentBoxes = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentBox(label: 'UPI', amount: upiAmount),
            const SizedBox(height: 8),
            PaymentBox(label: 'Cash', amount: cashAmount),
          ],
        );

        Widget partialPaymentToggle = Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Transform.scale(
                  scale: 0.85,
                  child: Switch(
                    value: isPartialPaymentEnabled,
                    onChanged: onPartialPaymentChanged,
                    activeColor: const Color(0xFF1E3A5F),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'Partial Payment',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        );

        if (isSmallScreen) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              paymentBoxes,
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [partialPaymentToggle],
              ),
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            paymentBoxes,
            const Spacer(),
            partialPaymentToggle,
          ],
        );
      },
    );
  }
}