import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Model/transaction.dart';
 
class TransactionWidget extends StatelessWidget {
  final Transaction tran;

  const TransactionWidget({super.key, required this.tran});

  @override
  Widget build(BuildContext context) {
    final bool isCredit = tran.credit;

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[200]!),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tran.rideType,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  tran.date,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                '${isCredit ? '+' : '-'}${tran.amount}',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: isCredit ? Colors.blue.shade900 : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
