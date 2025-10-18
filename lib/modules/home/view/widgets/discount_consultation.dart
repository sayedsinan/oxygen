import 'package:flutter/material.dart';

class ConsultationFeeDiscount extends StatelessWidget {
  final double consultationFee;
  final TextEditingController discountController;

  const ConsultationFeeDiscount({
    super.key,
    required this.consultationFee,
    required this.discountController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;

        Widget feeContainer = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Consultation Fee', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              const SizedBox(height: 8),
              Text('\$$consultationFee', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            ],
          ),
        );

        Widget discountContainer = Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discount (Optional)', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('eg: ', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  SizedBox(
                    width: 50,
                    height: 30,
                    child: TextField(
                      controller: discountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        hintText: '50',
                        hintStyle: TextStyle(fontSize: 11, color: Colors.grey[400]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      value: 'Referral',
                      isDense: true,
                      items: ['Referral', 'Coupon', 'Manual']
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e, style: const TextStyle(fontSize: 11))))
                          .toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        );

        if (isSmallScreen) {
          return Column(
            children: [
              feeContainer,
              const SizedBox(height: 12),
              discountContainer,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: feeContainer),
            const SizedBox(width: 12),
            Expanded(child: discountContainer),
          ],
        );
      },
    );
  }
}