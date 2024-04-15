class Person {
  int? id;
  String firstName;
  String lastName;

  Person({this.id, required this.firstName, required this.lastName});

  Person.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        firstName = map['firstName'],
        lastName = map['lastName'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
