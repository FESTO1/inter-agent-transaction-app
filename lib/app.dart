import 'package:flutter/material.dart';
import 'package:inter_agent_money_transaction_app/Core/Components/navigation_bar.dart';
import 'package:inter_agent_money_transaction_app/Pages/dashboard_page.dart';
import 'package:inter_agent_money_transaction_app/Pages/confirmation.dart';
import 'package:inter_agent_money_transaction_app/Pages/history.dart';
import 'package:inter_agent_money_transaction_app/Pages/home.dart';
import 'package:inter_agent_money_transaction_app/Pages/profile_page.dart';
import 'package:inter_agent_money_transaction_app/Pages/transfer_page.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   //   @override
//   //   Widget build(BuildContext context) {
//   //     return MaterialApp(
//   //       title: 'Inter Agent Mobile App',
//   //       debugShowCheckedModeBanner: false,
//   //        theme: ThemeData(
//   //         primarySwatch: Colors.blue,
//   //         visualDensity: VisualDensity.adaptivePlatformDensity,
//   //       ),

//   //       home: const DashboardPage(),
//   //     );
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/dashboard',
//       routes: {
//         '/dashboard': (context) => DashboardPage(),
//         '/transfer': (context) => TransferPage(),
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    DashboardPage(),
    TransferPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
