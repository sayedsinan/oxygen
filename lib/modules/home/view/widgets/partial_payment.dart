import 'package:flutter/material.dart';

class PartialPaymentSection extends StatelessWidget {
  final TextEditingController partialAmountController;
  final double balanceDue;

  const PartialPaymentSection({
    super.key,
    required this.partialAmountController,
    required this.balanceDue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Enter Amount :', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            const SizedBox(width: 12),
            Container(
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: partialAmountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: '₹300',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Balance Due After Payment: ', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
            Text('₹${balanceDue.toInt()}', style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }
}
