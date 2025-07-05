import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.blue[900], size: 40),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jane Doe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '+254712345678',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Agent ID: AGT001',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Agent Numbers',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildAgentNumber('HaloPesa', '+254712345678', Colors.green),
            _buildAgentNumber('Airtel Money', '+254712345678', Colors.red),
            ListTile(
              leading: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green[100],
                child: Icon(Icons.add, size: 16, color: Colors.green),
              ),
              title: Text('Add New Provider Number'),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
            SizedBox(height: 16),
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            // _buildSettingOption(
            //   'Super Agent Dashboard',
            //   Icons.shield,
            //   Colors.blue[100]!,
            //   () {},
            // ),
            _buildSettingOption(
              'Logout',
              Icons.logout,
              Colors.red[100]!,
              () {},
            ),
            Spacer(),
            Center(
              child: Text(
                'PesaHub v1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    
    );
  }

  Widget _buildAgentNumber(String provider, String number, Color color) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundColor: color.withOpacity(0.2),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: color,
        ),
      ),
      title: Text(provider),
      trailing: Text(number, style: TextStyle(color: Colors.blue[900])),
    );
  }

  Widget _buildSettingOption(String title, IconData icon, Color color, VoidCallback onTap) {
    return ListTile(
      leading: CircleAvatar(
        radius: 12,
        backgroundColor: color,
        child: Icon(icon, size: 16, color: Colors.white),
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}