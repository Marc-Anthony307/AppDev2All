import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotels',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelBookingPage(),
    );
  }
}

class HotelBookingPage extends StatefulWidget {
  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  int guests = 1;
  int rooms = 1;

  void incrementGuests() {
    setState(() {
      guests++;
    });
  }

  void decrementGuests() {
    if (guests > 1) {
      setState(() {
        guests--;
      });
    }
  }

  void incrementRooms() {
    setState(() {
      rooms++;
    });
  }

  void decrementRooms() {
    if (rooms > 1) {
      setState(() {
        rooms--;
      });
    }
  }

  void reserve() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You are trying to book $guests guests and $rooms rooms.'),
      ),
    );
  }

  void bookHotels() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(guests: guests, rooms: rooms),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 5),
                Text(
                  '$guests Guests',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                _buildCustomButton(Icons.remove, decrementGuests),
                _buildCustomButton(Icons.add, incrementGuests),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.hotel),
                SizedBox(width: 5),
                Text(
                  '$rooms Rooms',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 10),
                _buildCustomButton(Icons.remove, decrementRooms),
                _buildCustomButton(Icons.add, incrementRooms),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: reserve,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Reserve',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: bookHotels,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Book Hotels',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}

class ConfirmationPage extends StatelessWidget {
  final int guests;
  final int rooms;

  ConfirmationPage({required this.guests, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Booking Confirmed!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Guests: $guests',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rooms: $rooms',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
