import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final bool isSent;
  final String provider;
  final String amount;
  final String dateTime;
  final String status;

  const TransactionCard({super.key, 
    required this.isSent,
    required this.provider,
    required this.amount,
    required this.dateTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: isSent ? Colors.orange[100] : Colors.green[100],
              child: Icon(
                isSent ? Icons.arrow_upward : Icons.arrow_downward,
                color: isSent ? Colors.orange : Colors.green,
                size: 20,
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${isSent ? "Sent to" : "Received from"} $provider',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(dateTime, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: TextStyle(
                color: isSent ? Colors.orange : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(status, style: TextStyle(color: Colors.green)),
          ],
        ),
      ],
    );
  }
}