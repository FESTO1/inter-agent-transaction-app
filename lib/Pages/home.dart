import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/card.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/quickAccess.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/transaction.dart';
import 'package:inter_agent_money_transaction_app/Core/Data/card.dart';
import 'package:inter_agent_money_transaction_app/Core/Data/quick_access.dart';
import 'package:inter_agent_money_transaction_app/Core/Data/transcation.dart';

// void main() {
//   runApp(const HomePage());
// }

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const Home(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.baby_changing_station, color: Colors.grey[900]),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/81/9f/b8/819fb8b2baa84564043bfb1d81e7c323.jpg',
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Good Evening',
                style: TextStyle(fontSize: 25, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Joan Louji',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: quick.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: QuickAccessWidget(quick: quick[index]),
                    );
                  },
                ),
              ),
              const Text(
                'Cards',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: card.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: CardWidget(card: card[index]),
                    );
                  },
                ),
              ),
              const Text(
                'Transcation History',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: transaction.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: TransactionWidget(tran: transaction[index]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
