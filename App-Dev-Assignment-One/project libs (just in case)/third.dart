import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyNavigationBar(),
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = [
    Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset('assets/IMG_5162.jpg'),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 100.0),
          //if I wanted to, I can use ".all" instead of only for padding all around
          child: Text(
            'The best dog\nin the world',
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 55.0),
          //if I wanted to, I can use ".all" instead of only for padding all around
          child: Text(
            'What is he doing?',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white, height: 1.2),
          ),
        ),
      ],
    ),
    PictureSearchScreen(),
    TempConverter()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search Page',
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings Page',
            backgroundColor: Colors.yellow,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemtapped,
        elevation: 5,
      ),
    );
  }

  void _onItemtapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PictureSearchScreen extends StatelessWidget {

  // The list of my image paths
  final List<String> imagePaths = [
    'assets/happy.png',
    'assets/whirl.png',
    'assets/scared.png',
    'assets/happy.png',
    'assets/whirl.png',
    'assets/scared.png',
    'assets/happy.png',
    'assets/whirl.png',
    'assets/scared.png',
  ];

  // List for the text that will be under the images
  final List<String> text = [
    'Happy',
    'Confused',
    'Scared',
    'Happy',
    'Confused',
    'Scared',
    'Happy',
    'Confused',
    'Scared',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Grid'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  width: 100.0,
                  height: 100.0,
                ),
                SizedBox(height: 5), // the space between the photo and text
                Text(
                  text[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class TempConverter extends StatefulWidget {
  const TempConverter({super.key});

  @override
  State<TempConverter> createState() => TemperatureConverterState();
}

class TemperatureConverterState extends State<TempConverter> {
  double fahrenheitValue = 0.0;
  double celsiusValue = 0.0;
  bool convertToFahrenheit = true;
  TextEditingController textFieldController = TextEditingController();

  void _convertTemperature() {
    setState(() {
      double inputValue = double.tryParse(textFieldController.text) ?? 0.0;
      if (convertToFahrenheit) {
        fahrenheitValue = inputValue;
        celsiusValue = (fahrenheitValue - 32) * 5 / 9;
      } else {
        celsiusValue = inputValue;
        fahrenheitValue = (celsiusValue * 9 / 5) + 32;
      }
      // Round the temperature to one decimal place
      fahrenheitValue = double.parse(fahrenheitValue.toStringAsFixed(1));
      celsiusValue = double.parse(celsiusValue.toStringAsFixed(1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Convert Temperature'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      convertToFahrenheit = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                  child: Text('F->C'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      convertToFahrenheit = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                  child: Text('C->F'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _convertTemperature();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                foregroundColor: Colors.black,
              ),
              child: Text('SUBMIT'),
            ),
            SizedBox(height: 20),
            Container(
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                convertToFahrenheit ? '$celsiusValue°C' : '$fahrenheitValue°F',
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



