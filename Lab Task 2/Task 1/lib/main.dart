import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/photo.png'),
            ),
            const Text(
              'Tynk Huynk',
              style: TextStyle(
                  fontFamily: 'Cursive',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              'MOBILE DEVELOPER',
              style: TextStyle(
                fontFamily: 'Comic Sans',
                color: Colors.greenAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.greenAccent,
              ),
            ),
            Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                title: Text(
                  '+84 123456789',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                title: Text(
                  'tynk.mobiledev@gmail.com',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: Colors.green,
                ),
                title: Text(
                  '@tinh_huynh_97',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: const Icon(
                  Icons.phonelink_ring,
                  color: Colors.green,
                ),
                title: Text(
                  'TinhHuynh',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
