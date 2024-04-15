import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (response.statusCode == 200) {
      setState(() {
        photos = json.decode(response.body);
      });
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (context, index) {
            var photo = photos[index];
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(photo['thumbnailUrl']),
                radius: 25,
              ),
              title: Text('${photo['title']}'),
              subtitle: Text('${photo['id']}\n${photo['albumId']}'),
              isThreeLine: true,
              trailing: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    scale: 100,
                    image: NetworkImage(photo['url']),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            );
          },
        )
    );
  }
}
