import 'package:flutter/material.dart';

class BookedCard extends StatelessWidget {
  final String name;
  final Color color;
  final double bookings;
  const BookedCard({Key? key, required this.name, required this.color, required this.bookings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration:  BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
               Flexible(
                // 🔹 Added Flexible to prevent text overflow
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow:
                      TextOverflow.ellipsis, // 🔹 Handle overflow gracefully
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
           Text(
           bookings.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

