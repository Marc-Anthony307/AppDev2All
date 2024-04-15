import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'notifications_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Flutter'),
              accountEmail: Text('flutter@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'F',
                  style: TextStyle(fontSize: 40.0, color: Colors.black),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.orange, // Change this color to your desired color
                // You can add additional decoration here if needed
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logging out from the app'),
                  ),
                );
                // Add logout logic here if necessary
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
          width: 200, // Set the width
          height: 100, // Set the height
          child: Center(
            child: Text(
              'Welcome Sakku',
              textAlign: TextAlign.center, // Align text within the container
              style: TextStyle(fontSize: 20), // You can also adjust the font size here
            ),
          ),
        ),
      ),
    );
  }
}
