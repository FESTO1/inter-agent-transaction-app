import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Model/quick_access.dart';
 
class QuickAccessWidget extends StatelessWidget {
  final Quick quick;

  const QuickAccessWidget({super.key, required this.quick});

  @override
  Widget build(BuildContext context) {
    final bool isRed = quick.color == Colors.red;
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 100,
        width: 200,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[350]!),
          borderRadius: BorderRadius.circular(20),
          color: isRed ? Colors.blue.shade700 : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isRed ? Colors.grey[200] : Colors.blue,
              ),
              child: Icon(
                Icons.access_alarm, 
                 size: 15,
                color: isRed ? Colors.grey[800] : Colors.grey[200],
              ),
            ),
            Text(
              quick.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isRed ? Colors.grey[200] : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
