import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Model/card.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;

  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return CardWidgetContent(card: card);
  }
}

class CardWidgetContent extends StatelessWidget {
  final CardModel card;

  const CardWidgetContent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3.5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 400,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.shade900,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Top Row: Card Number and Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCardDetail("Card Number", card.cardNumber),
                SizedBox(
                  width: 40,
                  child: Image.asset(card.icon!),
                ),
              ],
            ),
            // Bottom Row: Holder Name and Expiry
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCardDetail("CARD HOLDER NAME", card.holderName),
                _buildCardDetail("EXPIRY DATE", card.expiryDate),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDetail(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 15, color: Colors.grey[300])),
        Text(value ?? "",
            style: TextStyle(fontSize: 25, color: Colors.grey[100])),
      ],
    );
  }
}
