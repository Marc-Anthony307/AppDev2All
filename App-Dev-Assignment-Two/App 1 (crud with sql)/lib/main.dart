import 'package:flutter/material.dart';
import 'dbhelper.dart';
import 'person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite CRUD Operations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  List<Person> people = [];
  int? _editedPersonId;

  @override
  void initState() {
    super.initState();
    _refreshPersonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite CRUD Operations'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last name',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _addPerson(),
                      child: Text('ADD'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updatePerson(),
                      child: Text('UPDATE'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildPersonListView(),
          ),
        ],
      ),
    );
  }

  ListView _buildPersonListView() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Person person = people[index];
        return Card(
          child: ListTile(
            title: Text(person.firstName + " " + person.lastName),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      // Set the fields and also store the ID of the person being edited
                      _editedPersonId = person.id;
                      firstNameController.text = person.firstName;
                      lastNameController.text = person.lastName;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deletePerson(person.id!),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addPerson() async {
    final person = Person(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    await dbHelper.insert(person);
    _refreshPersonList();
    firstNameController.clear();
    lastNameController.clear();
  }

  void _updatePerson() async {
    if (_editedPersonId == null ||
        firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty) {
      return;
    }

    Person personToUpdate = Person(
      id: _editedPersonId,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
    );
    await dbHelper.update(personToUpdate);
    _refreshPersonList();

    setState(() {
      _editedPersonId = null;
      firstNameController.clear();
      lastNameController.clear();
    });
  }


  void _deletePerson(int id) async {
    await dbHelper.delete(id);
    _refreshPersonList();
  }

  void _refreshPersonList() async {
    List<Person> x = await dbHelper.queryAll();
    setState(() {
      people = x;
    });
  }
}
