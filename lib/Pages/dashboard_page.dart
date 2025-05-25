import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/provider_card.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/transaction_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Hi, John',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Agent ID Section
              Container(
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
                        Text('Agent ID', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text('AG1234',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Verify', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Your Balances Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Balances',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('View all', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ProviderCard(
                name: 'HaloPesa',
                amount: 'TSh 1,250,000',
                indicatorColor: Colors.green,
              ),
              SizedBox(height: 8),
              ProviderCard(
                name: 'Airtel Money',
                amount: 'TSh 850,000',
                indicatorColor: Colors.red,
              ),
              SizedBox(height: 16),
              // Quick Actions Section
              Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('New Transfer',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Convert between providers',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Recent Transactions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    TransactionCard(
                      isSent: true,
                      provider: 'Airtel',
                      amount: '-TSh 500,000',
                      dateTime: '15 Apr 2023, 14:30',
                      status: 'Completed',
                    ),
                    SizedBox(height: 16),
                    TransactionCard(
                      isSent: false,
                      provider: 'Airtel',
                      amount: '+TSh 300,000',
                      dateTime: '14 Apr 2023, 10:15',
                      status: 'Completed',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    
    );
  }
}