import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.nom,
    required this.prenom,
    required this.contact,
    required this.password,
    required this.email,
  });

  String nom;
  String prenom;
  String contact;
  String password;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        nom: json["nom"],
        prenom: json["prenom"],
        contact: json["contact"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "contact": contact,
        "password": password,
        "email": email,
      };
}
