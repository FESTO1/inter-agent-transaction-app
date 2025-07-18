import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  TransferPageState createState() => TransferPageState();
}

class TransferPageState extends State<TransferPage> {
  String? _fromProvider = 'HaloPesa';
  String? _toProvider = 'Airtel Money';
  final TextEditingController _amountController = TextEditingController(
    text: '393292',
  );
  final List<String> _providers = ['HaloPesa', 'Airtel Money'];

  List<String> _getAvailableToProviders() {
    return _providers.where((provider) => provider != _fromProvider).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> availableToProviders = _getAvailableToProviders();

    // Ensure _toProvider is valid based on the available options
    if (!availableToProviders.contains(_toProvider)) {
      _toProvider =
          availableToProviders.isNotEmpty ? availableToProviders[0] : null;
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            // From Provider Section
            Text(
              'From Provider',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              _fromProvider == 'HaloPesa'
                                  ? Colors.green[100]
                                  : Colors.red[100],
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor:
                                _fromProvider == 'HaloPesa'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: DropdownButton<String>(
                            value: _fromProvider,
                            isExpanded: true,
                            underline: SizedBox(),
                            items:
                                _providers.map((String provider) {
                                  return DropdownMenuItem<String>(
                                    value: provider,
                                    child: Text(provider),
                                  );
                                }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _fromProvider = newValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
             SizedBox(height: 16),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(Icons.arrow_forward, color: Colors.blue[900]),
                  ),
                ),
            SizedBox(height: 16),
            // To Provider Section
            Text(
              'To Provider',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        _toProvider == 'HaloPesa'
                            ? Colors.green[100]
                            : Colors.red[100],
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor:
                          _toProvider == 'HaloPesa' ? Colors.green : Colors.red,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: DropdownButton<String>(
                      value: _toProvider,
                      isExpanded: true,
                      underline: SizedBox(),
                      items:
                          availableToProviders.map((String provider) {
                            return DropdownMenuItem<String>(
                              value: provider,
                              child: Text(provider),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _toProvider = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Amount Section
            Text(
              'Amount (TZS)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Available balance: TSh 1,250,000',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'CONTINUE',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
