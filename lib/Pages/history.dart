import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/transaction_card.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _transactions = [
    {
      'isSent': true,
      'provider': 'Airtel',
      'amount': '-TSh 500,000',
      'dateTime': '15 Apr 2023, 14:30',
      'status': 'Completed',
    },
    {
      'isSent': false,
      'provider': 'Airtel',
      'amount': '+TSh 300,000',
      'dateTime': '14 Apr 2023, 10:15',
      'status': 'Completed',
    },
    {
      'isSent': true,
      'provider': 'HaloPesa',
      'amount': '-TSh 200,000',
      'dateTime': '13 Apr 2023, 09:45',
      'status': 'Completed',
    },
    {
      'isSent': false,
      'provider': 'HaloPesa',
      'amount': '+TSh 150,000',
      'dateTime': '12 Apr 2023, 16:20',
      'status': 'Completed',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Transaction History',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Sent'),
            Tab(text: 'Received'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // All Transactions
                  _buildTransactionList(_transactions),
                  // Sent Transactions
                  _buildTransactionList(
                      _transactions.where((tx) => tx['isSent']).toList()),
                  // Received Transactions
                  _buildTransactionList(
                      _transactions.where((tx) => !tx['isSent']).toList()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList(List<Map<String, dynamic>> transactions) {
    if (transactions.isEmpty) {
      return Center(
        child: Text(
          'No transactions found',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
      );
    }
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: transactions
                .asMap()
                .entries
                .map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> tx = entry.value;
                  return Column(
                    children: [
                      TransactionCard(
                        isSent: tx['isSent'],
                        provider: tx['provider'],
                        amount: tx['amount'],
                        dateTime: tx['dateTime'],
                        status: tx['status'],
                      ),
                      if (index < transactions.length - 1) SizedBox(height: 16),
                    ],
                  );
                })
                .toList(),
          ),
        ),
      ],
    );
  }
}