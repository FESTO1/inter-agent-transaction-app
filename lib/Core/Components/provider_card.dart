import 'package:flutter/material.dart';

extension ColorOpacity on Color {
  Color withOpacityValue(double opacity) {
    return Color.fromARGB(
      (opacity * 255).toInt(), // alpha
      (r * 255.0).round() & 0xff, // red
      (g * 255.0).round() & 0xff, // green
      (b * 255.0).round() & 0xff, // blue
    );
  }
}

// ...rest of your code...
class ProviderCard extends StatelessWidget {
  final String name;
  final String amount;
  final Color indicatorColor;

  const ProviderCard({super.key, 
    required this.name,
    required this.amount,
    required this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: Colors.grey)),
              SizedBox(height: 4),
              Text(amount,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          CircleAvatar(
            radius: 12,
            backgroundColor: indicatorColor.withOpacityValue(0.2),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: indicatorColor,
            ),
          ),
        ],
      ),
    );
  }
}