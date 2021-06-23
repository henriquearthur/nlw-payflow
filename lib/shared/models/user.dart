import 'dart:convert';

class User {
  final String name;
  final String email;
  final String? photoURL;

  User({
    required this.name,
    required this.email,
    this.photoURL,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'], email: map['email'], photoURL: map['photoURL']);
  }

  factory User.fromJson(String json) => User.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() =>
      {"name": name, "email": email, "photoURL": photoURL};

  String toJson() => jsonEncode(toMap());
}
